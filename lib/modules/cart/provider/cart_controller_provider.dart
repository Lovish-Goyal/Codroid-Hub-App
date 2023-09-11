import 'package:codroid_hub/auth/provider/user_provider.dart';
import 'package:codroid_hub/modules/cart/provider/cart_services.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CourseModel>>(
    (ref) => CartNotifier(ref: ref));

class CartNotifier extends StateNotifier<List<CourseModel>> {
  final Ref _ref;
  CartNotifier({required Ref ref})
      : _ref = ref,
        super([]);

  Future<List<CourseModel>> getCartItemsList() async {
    final cartMethods = _ref.watch(cartServicesProvider);
    state = await cartMethods.getCartItemsList() ?? [];
    return state;
  }

  Future addItemToCart(String cartItemId, BuildContext context) async {
    final user = await _ref.watch(authServicesProvider).getCurrentUser();

    if (user == null) {
      if (!mounted) return;
      showSnackBar(context, "Please login to add item to cart");
      return;
    }
    final cartMethods = _ref.watch(cartServicesProvider);
    cartMethods.addItemToCart(cartItemId);
    if (!mounted) return;
    showSnackBar(context, "Item added to cart");

    state = await cartMethods.getCartItemsList() ?? [];
  }

  Future removeItemFromCart(String productId, BuildContext context) async {
    final cartMethods = _ref.watch(cartServicesProvider);

    cartMethods.removeItemFromCart(productId);
    if (!mounted) return;
    showSnackBar(context, "Item removed from cart");

    state = await cartMethods.getCartItemsList() ?? [];

    // state = state.where((item) => item.productId != productId).toList();
  }
}
