// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartItem {
  final String productId;
  final String productName;
  final double price;
  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
  });

  CartItem copyWith({
    String? productId,
    String? productName,
    double? price,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'price': price,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartItem(productId: $productId, productName: $productName, price: $price)';

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.productId == productId &&
      other.productName == productName &&
      other.price == price;
  }

  @override
  int get hashCode => productId.hashCode ^ productName.hashCode ^ price.hashCode;
}
