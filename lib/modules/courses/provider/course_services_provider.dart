import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/models/course_outline_model.dart';
import 'package:codroid_hub/modules/courses/provider/course_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final courseDatabaseProvider = Provider<CourseServices>((ref) {
  return CourseServices(
    ref: ref,
  );
});

class CourseServices {
  final ProviderRef ref;

  CourseServices({required this.ref});
  Future<String?> createCourses(CourseModel course) async {
    try {
      await ApiClient.database.createDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.courseCollectionId,
          documentId: ID.unique(),
          data: course.toMap());

      Logger().f("course Created succesfully");
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.message;
    } catch (e) {
      Logger().e(e);
      return e.toString();
    }
    return null;
  }

  Future<String?> createOutline(CourseOutlineModel courseOutline) async {
    try {
      await ApiClient.database.createDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.outlineCollectionId,
          documentId: ID.unique(),
          data: courseOutline.toMap());

      // ignore: unused_result
      ref.refresh(courseOutlineListProvider(courseOutline.courseId!));
      Logger().f("courseOutline Created succesfully");
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.message;
    } catch (e) {
      Logger().e(e);
      return e.toString();
    }
    return null;
  }
}
