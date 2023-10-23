// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CourseOutlineModel {
  String mainOutline;
  List<String> subOutline;
  String? courseId;
  String? id;
  String? createdAt;
  String? updatedAt;
  CourseOutlineModel({
    required this.mainOutline,
    required this.subOutline,
    this.courseId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  CourseOutlineModel copyWith({
    String? mainOutline,
    List<String>? subOutline,
    String? courseId,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) {
    return CourseOutlineModel(
      mainOutline: mainOutline ?? this.mainOutline,
      subOutline: subOutline ?? this.subOutline,
      courseId: courseId ?? this.courseId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mainOutline': mainOutline,
      'subOutline': subOutline,
      'courseId': courseId,
      // 'id': id,
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }

  factory CourseOutlineModel.fromMap(Map<String, dynamic> map) {
    return CourseOutlineModel(
      mainOutline: map['mainOutline'] as String,
      subOutline: List<String>.from((map['subOutline'])),
      courseId: map['courseId'] as String,
      id: map['\$id'] != null ? map['\$id'] as String : null,
      createdAt:
          map['\$createdAt'] != null ? map['\$createdAt'] as String : null,
      updatedAt:
          map['\$updatedAt'] != null ? map['\$updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseOutlineModel.fromJson(String source) =>
      CourseOutlineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseOutlineModel(mainOutline: $mainOutline, subOutline: $subOutline, courseId: $courseId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant CourseOutlineModel other) {
    if (identical(this, other)) return true;

    return other.mainOutline == mainOutline &&
        listEquals(other.subOutline, subOutline) &&
        other.courseId == courseId &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return mainOutline.hashCode ^
        subOutline.hashCode ^
        courseId.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
