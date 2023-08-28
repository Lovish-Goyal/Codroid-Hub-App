import 'package:codroid_hub/modules/cart/model/cart_model.dart';
import 'package:codroid_hub/modules/cart/provider/cart_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier(ref: ref));

class CartNotifier extends StateNotifier<List<CartItem>> {
  final Ref _ref;
  CartNotifier({required Ref ref})
      : _ref = ref,
        super([]);

  void addItemToCart(String userId, String cartItemId) {
    final cartMethods = _ref.watch(cartServicesProvider);
    cartMethods.addItemToCart(userId, cartItemId);
    // TODO: STATE MANAGEMENT NEEDED FOR CART 
  }

  void removeItemFromCart(String productId) {
    state = state.where((item) => item.productId != productId).toList();
  }
}

extension CartItemExtensions on CartItem {
  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      productName: productName,
      price: price,
    );
  }
}
