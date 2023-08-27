// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      title: json['title'] as String? ?? "",
      author: json['author'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'imgUrl': instance.imgUrl,
      'price': instance.price,
      'description': instance.description,
    };
