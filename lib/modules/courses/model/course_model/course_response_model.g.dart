// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponseModel _$CourseResponseModelFromJson(Map<String, dynamic> json) =>
    CourseResponseModel(
      course: json['course'] as String? ?? "",
      title: json['title'] as String? ?? "",
      author: json['author'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? "",
      $id: json[r'$id'] as String?,
      $createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$CourseResponseModelToJson(
        CourseResponseModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'title': instance.title,
      'author': instance.author,
      'imgUrl': instance.imgUrl,
      'price': instance.price,
      'description': instance.description,
      r'$id': instance.$id,
      r'$createdAt': instance.$createdAt?.toIso8601String(),
      r'$updatedAt': instance.$updatedAt?.toIso8601String(),
    };
