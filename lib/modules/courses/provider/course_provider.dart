import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/models/course_outline_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final courseListProvider = FutureProvider((ref) async {
  try {
    final database = ApiClient.database;
    final DocumentList result = await database.listDocuments(
      collectionId: Env.courseCollectionId,
      databaseId: Env.dataBaseId,
    );

    final courseList =
        result.documents.map((e) => CourseModel.fromMap(e.data)).toList();
    return courseList;
  } on AppwriteException catch (error) {
    Logger().e(error.message);
    return [];
  }
});

final courseOutlineListProvider =
    FutureProvider.family<List<CourseOutlineModel>, String>((
  ref,
  courseId,
) async {
  try {
    final database = ApiClient.database;
    final DocumentList result = await database.listDocuments(
        collectionId: Env.outlineCollectionId,
        databaseId: Env.dataBaseId,
        queries: [Query.equal("courseId", courseId)]);

    final courseOutlineList = result.documents
        .map((e) => CourseOutlineModel.fromMap(e.data))
        .toList();
    Logger().i(courseOutlineList);
    return courseOutlineList;
  } on AppwriteException catch (error) {
    Logger().e(error.message);
    return [];
  }
});
