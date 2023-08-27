import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final List<dynamic> cart;
  final List<dynamic> favourites;
  final List<dynamic> orders;
  final String address;
  final String phone;
  final bool isAdmin;
  final String profileImg;
  final List<dynamic> transactions;
  final String? $id;
  final DateTime? $createdAt;
  final DateTime? $updatedAt;

  const UserModel({
    this.name = "",
    this.email = "",
    this.cart = const [],
    this.favourites = const [],
    this.orders = const [],
    this.address = "",
    this.phone = "",
    this.isAdmin = false,
    this.transactions = const [],
    this.profileImg = "",
    this.$id,
    this.$createdAt,
    this.$updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? name,
    String? email,
    List<dynamic>? cart,
    List<dynamic>? favourites,
    List<dynamic>? orders,
    String? address,
    String? phone,
    bool? isAdmin,
    List<dynamic>? transactions,
    String? $id,
    DateTime? $createdAt,
    DateTime? $updatedAt,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      cart: cart ?? this.cart,
      favourites: favourites ?? this.favourites,
      orders: orders ?? this.orders,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      isAdmin: isAdmin ?? this.isAdmin,
      transactions: transactions ?? this.transactions,
      $id: $id ?? this.$id,
      $createdAt: $createdAt ?? this.$createdAt,
      $updatedAt: $updatedAt ?? this.$updatedAt,
    );
  }
}
