import 'package:json_annotation/json_annotation.dart';

part 'course_request_model.g.dart';

@JsonSerializable()
class CourseModel {
  
  final String title;
  final String author;
  final String imgUrl;
  final double price;
  final String description;

  const CourseModel({
  
    this.title = "",
    this.author = "",
    this.imgUrl = "",
    this.price = 0.0,
    this.description = "",
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
