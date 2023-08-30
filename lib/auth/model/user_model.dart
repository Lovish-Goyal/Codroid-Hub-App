// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

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
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  UserModel({
    required this.name,
    required this.email,
    required this.cart,
    required this.favourites,
    required this.orders,
    required this.address,
    required this.phone,
    required this.isAdmin,
    required this.profileImg,
    required this.transactions,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    String? name,
    String? email,
    List<dynamic>? cart,
    List<dynamic>? favourites,
    List<dynamic>? orders,
    String? address,
    String? phone,
    bool? isAdmin,
    String? profileImg,
    List<dynamic>? transactions,
    String? id,
    String? createdAt,
    String? updatedAt,
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
      profileImg: profileImg ?? this.profileImg,
      transactions: transactions ?? this.transactions,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'cart': cart,
      'favourites': favourites,
      'orders': orders,
      'address': address,
      'phone': phone,
      'isAdmin': isAdmin,
      'profileImg': profileImg,
      'transactions': transactions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      cart: List<dynamic>.from((map['cart'] as List<dynamic>)),
      favourites: List<dynamic>.from((map['favourites'] as List<dynamic>)),
      orders: List<dynamic>.from((map['orders'] as List<dynamic>)),
      address: map['address'] as String,
      phone: map['phone'] as String,
      isAdmin: map['isAdmin'] as bool,
      profileImg: map['profileImg'] as String,
      transactions: List<dynamic>.from((map['transactions'] as List<dynamic>)),
      id: map['\$id'] as String?,
      createdAt: map['\$createdAt'] as String?,
      updatedAt: map['\$updatedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, cart: $cart, favourites: $favourites, orders: $orders, address: $address, phone: $phone, isAdmin: $isAdmin, profileImg: $profileImg, transactions: $transactions, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        listEquals(other.cart, cart) &&
        listEquals(other.favourites, favourites) &&
        listEquals(other.orders, orders) &&
        other.address == address &&
        other.phone == phone &&
        other.isAdmin == isAdmin &&
        other.profileImg == profileImg &&
        listEquals(other.transactions, transactions) &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        cart.hashCode ^
        favourites.hashCode ^
        orders.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        isAdmin.hashCode ^
        profileImg.hashCode ^
        transactions.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
