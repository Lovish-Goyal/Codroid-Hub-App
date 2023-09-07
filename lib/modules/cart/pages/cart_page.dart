import 'package:codroid_hub/modules/cart/provider/cart_controller_provider.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartProvider.notifier).getCartItemsList();
    return Scaffold(
      body: FutureBuilder(
        future: cartList,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final List<CourseModel> data = snapshot.data;
                    return Card(
                      child: ListTile(
                        title: Text(data[index].title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeItemFromCart("64eb8bcd4b906865298a",
                                    data[index].id ?? "")
                                .then((value) => setState(() {}));
                          },
                        ),
                      ),
                    );
                  },
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
