import 'package:codroid_hub/modules/cart/provider/cart_services.dart';
import 'package:codroid_hub/modules/courses/model/course_model.dart';
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

  Future addItemToCart(String userId, String cartItemId) async {
    final cartMethods = _ref.watch(cartServicesProvider);
    cartMethods.addItemToCart(userId, cartItemId);

    state = await cartMethods.getCartItemsList() ?? [];
  }

  Future removeItemFromCart(String userId, String productId) async {
    final cartMethods = _ref.watch(cartServicesProvider);

    cartMethods.removeItemFromCart(userId, productId);
    state = await cartMethods.getCartItemsList() ?? [];

    // state = state.where((item) => item.productId != productId).toList();
  }
}
