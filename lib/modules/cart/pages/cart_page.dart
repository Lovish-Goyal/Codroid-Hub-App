import 'dart:convert';
import 'package:codroid_hub/Screens/mobile/auth/login.dart';
import 'package:codroid_hub/modules/cart/provider/cart_controller_provider.dart';
import 'package:codroid_hub/modules/cart/razor%20pay/api_services.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:codroid_hub/utils/show_snackbar.dart';
import 'package:codroid_hub/widgets/appbar.dart';
import 'package:codroid_hub/widgets/end_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../auth/pages/login.dart';
import '../../../auth/provider/user_provider.dart';

class MobileCartPage extends ConsumerStatefulWidget {
  const MobileCartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileCartPageState();
}

class _MobileCartPageState extends ConsumerState<MobileCartPage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showSnackBar(context, "Payment Success");
    Logger().i("Payment Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showSnackBar(context, "Payment Failed");
    Logger().e(response.message);
    Logger().e("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authServicesProvider).getCurrentUser();
    final razorApiServices = ref.watch(razorPayApiServicesProvider);
    int total = 0;
    final cartList = ref.watch(cartProvider.notifier).getCartItemsList();
    //this future builder is user to make await the user
    return FutureBuilder(
        future: user,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loder();
          }
          return snapshot.data == null
              ? (kIsWeb ? LoginCustomAlert() : MobLogin())
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    toolbarHeight: 70,
                    title: const Text(
                      "My Cart",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  body: FutureBuilder(
                    future: cartList,
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      total = snapshot.data.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.price);
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loder();
                      }
                      return snapshot.hasData
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.isEmpty)
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 100),
                                          child: Image.network(
                                              "https://static.vecteezy.com/system/resources/thumbnails/005/006/007/small/no-item-in-the-shopping-cart-click-to-go-shopping-now-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg")),
                                      const Text("Your Cart is Empty",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 45),
                                        child: const Text(
                                          "Looks like you haven`t added anything to your cart. Go ahead and explore top courses",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final List<CourseModel> data =
                                        snapshot.data;
                                    return Card(
                                      child: ListTile(
                                        title: Text(data[index].title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                            "Price: ${data[index].price}/-"),
                                        leading: Image.network(
                                          data[index].imgUrl,
                                          width: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            ref
                                                .read(cartProvider.notifier)
                                                .removeItemFromCart(
                                                    data[index].id ?? "",
                                                    context)
                                                .then((value) => setState(() {
                                                      total = total -
                                                          data[index].price;
                                                    }));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                if (snapshot.data.isEmpty)
                                  const Text("")
                                else
                                  Card(
                                    child: ListTile(
                                      title: const Text("Total"),
                                      subtitle: Text(
                                        "$total Rs",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: TextButton(
                                          child: const Text("Checkout"),
                                          onPressed: () async {
                                            final apiRes =
                                                await razorApiServices
                                                    .razorPayApi(total,
                                                        const Uuid().v4());
                                            Logger().i(apiRes);

                                            final orderId =
                                                json.decode(apiRes)["id"];
                                            Logger().i(orderId);
                                            final options = {
                                              "key": "rzp_test_qRqtDl6Kpsdjx3",
                                              "order_id": orderId,
                                              "name": "codroid hub",
                                              "amount":
                                                  json.decode(apiRes)["amount"],
                                              "description": "testing payment",
                                              "currency": "INR",
                                              // "timeout": 300,
                                              "prefill": {
                                                "contact": "+917494979209",
                                                "email": "test@gmail.com",
                                              },
                                              "external": {
                                                "wallets": ["paytm"]
                                              }
                                            };
                                            try {
                                              _razorpay.open(options);
                                            } catch (e) {
                                              debugPrint(e.toString());
                                            }
                                          }),
                                    ),
                                  )
                              ],
                            )
                          : const Center(
                              child: Text("No Items In Cart",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            );
                    },
                  ),
                  drawer: const SizedBox(width: 220, child: EndDrawer()),
                );
        });
  }
}

class WebCartpage extends ConsumerStatefulWidget {
  const WebCartpage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebCartpageState();
}

class _WebCartpageState extends ConsumerState<WebCartpage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showSnackBar(context, "Payment Success");
    Logger().i("Payment Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showSnackBar(context, "Payment Failed");
    Logger().e(response.message);
    Logger().e("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authServicesProvider).getCurrentUser();
    final razorApiServices = ref.watch(razorPayApiServicesProvider);
    int total = 0;
    final cartList = ref.watch(cartProvider.notifier).getCartItemsList();
    //this future builder is user to make await the user
    return FutureBuilder(
        future: user,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loder();
          }
          return snapshot.data == null
              ? const LoginCustomAlert()
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                      toolbarHeight: 70,
                      backgroundColor: Colors.black87,
                      title: appBarhelper(context)),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Course cart",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        FutureBuilder(
                          future: cartList,
                          initialData: const [],
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            total = snapshot.data.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue + element.price);
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Something went wrong"),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Loder();
                            }
                            return snapshot.hasData
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (snapshot.data.isEmpty)
                                        Column(
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 100),
                                                child: Image.network(
                                                    "https://static.vecteezy.com/system/resources/thumbnails/005/006/007/small/no-item-in-the-shopping-cart-click-to-go-shopping-now-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg")),
                                            const Text("Your Cart is Empty",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 45),
                                              child: const Text(
                                                "Looks like you haven`t added anything to your cart. Go ahead and explore top courses",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                      GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width >
                                                        600
                                                    ? (MediaQuery.of(context)
                                                                .size
                                                                .width >
                                                            1000)
                                                        ? 3
                                                        : 2
                                                    : 1),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final List<CourseModel> data =
                                              snapshot.data;
                                          return Card(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  data[index].imgUrl,
                                                  height: 250,
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 15, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Title: ${data[index].title}",
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Text(
                                                        "Price: ${data[index].price.toString()}/-",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Container(
                                                        child: Text(
                                                          "Instructor: ${data[index].instructor}",
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey[800],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Container(
                                                        child: Text(
                                                          "Duration: 4-6 Weeks",
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey[800],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 150,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                    onPressed:
                                                                        () {
                                                                      context.push(
                                                                          "/courseDetails",
                                                                          extra:
                                                                              data[index]);
                                                                    },
                                                                    child: Text(
                                                                      "Explore",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            width: 150,
                                                            child: ElevatedButton
                                                                .icon(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                    onPressed:
                                                                        () {
                                                                      ref
                                                                          .read(cartProvider
                                                                              .notifier)
                                                                          .removeItemFromCart(
                                                                              data[index].id ??
                                                                                  "",
                                                                              context)
                                                                          .then((value) =>
                                                                              setState(() {
                                                                                total = total - data[index].price;
                                                                              }));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    label: Text(
                                                                      "Remove",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 10)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //  ListTile(
                                            //   title: Text(data[index].title,
                                            //       style: const TextStyle(
                                            //           fontWeight: FontWeight.bold)),
                                            //   subtitle:
                                            //       Text("${data[index].price} Rs"),
                                            //   leading:
                                            //       Image.network(data[index].imgUrl),
                                            //   trailing: IconButton(
                                            //     icon: const Icon(Icons.delete),
                                            // onPressed: () {
                                            //   ref
                                            //       .read(cartProvider.notifier)
                                            //       .removeItemFromCart(
                                            //           data[index].id ?? "",
                                            //           context)
                                            //       .then((value) => setState(() {
                                            //             total = total -
                                            //                 data[index].price;
                                            //           }));
                                            // },
                                            //   ),
                                            // ),
                                          );
                                        },
                                      ),
                                      (snapshot.data.isEmpty)
                                          ? Text("")
                                          : Card(
                                              child: ListTile(
                                                title: const Text("Total"),
                                                subtitle: Text(
                                                  "$total Rs",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: TextButton(
                                                    child:
                                                        const Text("Checkout"),
                                                    onPressed: () async {
                                                      final apiRes =
                                                          await razorApiServices
                                                              .razorPayApi(
                                                                  total,
                                                                  const Uuid()
                                                                      .v4());
                                                      Logger().i(apiRes);

                                                      final orderId = json
                                                          .decode(apiRes)["id"];
                                                      Logger().i(orderId);
                                                      final options = {
                                                        "key":
                                                            "rzp_test_qRqtDl6Kpsdjx3",
                                                        "order_id": orderId,
                                                        "name": "codroid hub",
                                                        "amount": json.decode(
                                                            apiRes)["amount"],
                                                        "description":
                                                            "testing payment",
                                                        "currency": "INR",
                                                        // "timeout": 300,
                                                        "prefill": {
                                                          "contact":
                                                              "+917494979209",
                                                          "email":
                                                              "test@gmail.com",
                                                        },
                                                        "external": {
                                                          "wallets": ["paytm"]
                                                        }
                                                      };
                                                      try {
                                                        _razorpay.open(options);
                                                      } catch (e) {
                                                        debugPrint(
                                                            e.toString());
                                                      }
                                                    }),
                                              ),
                                            )
                                    ],
                                  )
                                : const Center(
                                    child: Text("No Items In Cart",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  endDrawer: MediaQuery.of(context).size.width < 700
                      ? const EndDrawer()
                      : null,
                );
        });
  }
}

class CartItemCard extends StatelessWidget {
  final CourseModel course;
  const CartItemCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
