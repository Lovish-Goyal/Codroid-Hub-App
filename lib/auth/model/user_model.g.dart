// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      cart: json['cart'] as List<dynamic>? ?? const [],
      favourites: json['favourites'] as List<dynamic>? ?? const [],
      orders: json['orders'] as List<dynamic>? ?? const [],
      address: json['address'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      isAdmin: json['isAdmin'] as bool? ?? false,
      transactions: json['transactions'] as List<dynamic>? ?? const [],
      profileImg: json['profileImg'] as String? ?? "",
      $id: json[r'$id'] as String?,
      $createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'cart': instance.cart,
      'favourites': instance.favourites,
      'orders': instance.orders,
      'address': instance.address,
      'phone': instance.phone,
      'isAdmin': instance.isAdmin,
      'profileImg': instance.profileImg,
      'transactions': instance.transactions,
      r'$id': instance.$id,
      r'$createdAt': instance.$createdAt?.toIso8601String(),
      r'$updatedAt': instance.$updatedAt?.toIso8601String(),
    };
