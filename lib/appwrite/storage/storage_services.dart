import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final storageServicesProvider = Provider<StorageServices>((ref) {
  return StorageServices();
});

class StorageServices {
  Future<String?> uploadImage(File file) async {
    try {
      final uploadedImage = await ApiClient.storage.createFile(
          bucketId: Env.courseStorageBucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(path: file.path));
      final imgUrl = imgUrlConverter(uploadedImage.$id);
      Logger().i("image uploaded successfully");
      Logger().i(imgUrl);
      return imgUrl;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }

  static String imgUrlConverter(String imgId) {
    // final String s =
    //     "${Env.endpoint}/console/project-${Env.projectId}/storage/bucket-${Env.courseStorageBucketId}/file-$imgId";
    return "${Env.endpoint}/storage/buckets/${Env.courseStorageBucketId}/files/$imgId/view?project=${Env.projectId}&mode=admin";
  }
}
