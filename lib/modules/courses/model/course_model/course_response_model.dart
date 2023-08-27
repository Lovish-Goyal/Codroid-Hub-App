import 'package:json_annotation/json_annotation.dart';

part 'course_response_model.g.dart';

@JsonSerializable()
class CourseResponseModel {
  final String course;
  final String title;
  final String author;
  final String imgUrl;
  final double price;
  final String description;
  final String? $id;

  final DateTime? $createdAt;

  final DateTime? $updatedAt;

  const CourseResponseModel({
    this.course = "",
    this.title = "",
    this.author = "",
    this.imgUrl = "",
    this.price = 0.0,
    this.description = "",
    this.$id,
    this.$createdAt,
    this.$updatedAt,
  });

  factory CourseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseResponseModelToJson(this);
}
