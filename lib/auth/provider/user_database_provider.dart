import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userDatabaseProvider = Provider<UserDatabaseServices>((ref) {
  return UserDatabaseServices();
});

class UserDatabaseServices {
  Future<String?> saveUserData(UserModel user) async {
    try {
      await ApiClient.database.createDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.userCollectionId,
          documentId: ID.unique(),
          data: user.toJson());
      Logger().f("User data saved");
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
