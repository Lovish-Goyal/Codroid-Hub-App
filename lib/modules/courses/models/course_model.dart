// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseModel {
  final String title;
  final String instructor;
  final String imgUrl;
  final int price;
  final String description;
  final List<String>? courseOutline;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  CourseModel({
    required this.title,
    required this.instructor,
    required this.imgUrl,
    required this.price,
    required this.description,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.courseOutline,
  });

  CourseModel copyWith({
    String? title,
    String? instructor,
    String? imgUrl,
    int? price,
    String? description,
    List<String>? courseOutline,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) {
    return CourseModel(
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      description: description ?? this.description,
      courseOutline: courseOutline ?? this.courseOutline,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'instructor': instructor,
      'imgUrl': imgUrl,
      'price': price,
      'description': description,
      'courseOutline': courseOutline,
      // 'id': id,
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'] as String,
      instructor: map['instructor'] as String,
      imgUrl: map['imgUrl'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      courseOutline: map['courseOutline'] != null
          ? List<String>.from(map['courseOutline'] as List<dynamic>)
          : null,
      id: map['\$id'] != null ? map['\$id'] as String : null,
      createdAt:
          map['\$createdAt'] != null ? map['\$createdAt'] as String : null,
      updatedAt:
          map['\$updatedAt'] != null ? map['\$updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(title: $title, instructor: $instructor, imgUrl: $imgUrl, price: $price, description: $description, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, courseOutline: $courseOutline)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.instructor == instructor &&
        other.imgUrl == imgUrl &&
        other.price == price &&
        other.description == description &&
        other.courseOutline == courseOutline &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        instructor.hashCode ^
        imgUrl.hashCode ^
        price.hashCode ^
        description.hashCode ^
        courseOutline.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
