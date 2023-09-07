// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MembersModel {
  String name;
  String? email;
  String? phone;
  String? address;
  String? imgUrl;
  String? id;
  String? description;
  MembersModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.imgUrl,
    required this.id,
    required this.description,
  });

  MembersModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? imgUrl,
    String? id,
    String? description,
  }) {
    return MembersModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      imgUrl: imgUrl ?? this.imgUrl,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'imgUrl': imgUrl,
      'description': description,
    };
  }

  factory MembersModel.fromMap(Map<String, dynamic> map) {
    return MembersModel(
      name: map['name'] as String,
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      imgUrl: map['imgUrl'],
      id: map['\$id'] as String,
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MembersModel.fromJson(String source) =>
      MembersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MembersModel(name: $name, email: $email, phone: $phone, address: $address, imgUrl: $imgUrl, id: $id, description: $description)';
  }

  @override
  bool operator ==(covariant MembersModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.address == address &&
        other.imgUrl == imgUrl &&
        other.id == id &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        imgUrl.hashCode ^
        id.hashCode ^
        description.hashCode;
  }
}
