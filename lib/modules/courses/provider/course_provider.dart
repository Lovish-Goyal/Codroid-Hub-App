import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../model/course_model/course_response_model.dart';

final courseListProvider = FutureProvider((ref) async {
  try {
    final database = ApiClient.database;
    final DocumentList result = await database.listDocuments(
      collectionId: Env.courseCollectionId,
      databaseId: Env.dataBaseId,
    );

    Logger().i(result.documents.first.data);
    final courseList = result.documents
        .map((e) => CourseResponseModel.fromJson(e.data))
        .toList();
    return courseList;
  } on AppwriteException catch (error) {
    Logger().e(error.message);
    return [];
  }
});
