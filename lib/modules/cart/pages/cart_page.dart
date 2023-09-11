import 'dart:convert';

import 'package:codroid_hub/modules/cart/provider/cart_controller_provider.dart';
import 'package:codroid_hub/modules/cart/razor%20pay/api_services.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:codroid_hub/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
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
    final razorApiServices = ref.watch(razorPayApiServicesProvider);
    int total = 0;
    final cartList = ref.watch(cartProvider.notifier).getCartItemsList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: FutureBuilder(
        future: cartList,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          total = snapshot.data.fold(
              0, (previousValue, element) => previousValue + element.price);
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
                      const Text("No Items In Cart",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final List<CourseModel> data = snapshot.data;
                        return Card(
                          child: ListTile(
                            title: Text(data[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text("${data[index].price} Rs"),
                            leading: Image.network(data[index].imgUrl),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeItemFromCart(
                                        data[index].id ?? "", context)
                                    .then((value) => setState(() {
                                          total = total - data[index].price;
                                        }));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Card(
                      child: ListTile(
                        title: const Text("Total"),
                        subtitle: Text(
                          "$total Rs",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: TextButton(
                            child: const Text("Checkout"),
                            onPressed: () async {
                              final apiRes = await razorApiServices.razorPayApi(
                                  total, const Uuid().v4());
                              Logger().i(apiRes);

                              final orderId = json.decode(apiRes)["id"];
                              Logger().i(orderId);
                              final options = {
                                "key": "rzp_test_qRqtDl6Kpsdjx3",
                                "order_id": orderId,
                                "name": "codroid hub",
                                "amount": json.decode(apiRes)["amount"],
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
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                );
        },
      ),
    );
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
