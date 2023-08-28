import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/courses/model/course_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final courseListProvider = FutureProvider((ref) async {
  try {
    final database = ApiClient.database;
    final DocumentList result = await database.listDocuments(
      collectionId: Env.courseCollectionId,
      databaseId: Env.dataBaseId,
    );

    Logger().i(result.documents.first.data);
    final courseList =
        result.documents.map((e) => CourseModel.fromMap(e.data)).toList();
    return courseList;
  } on AppwriteException catch (error) {
    Logger().e(error.message);
    return [];
  }
});
