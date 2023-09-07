import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userDatabaseProvider = Provider<UserDatabaseServices>((ref) {
  return UserDatabaseServices(ref: ref);
});

class UserDatabaseServices {
  final ProviderRef ref;

  UserDatabaseServices({required this.ref});
  Future<String?> saveUserData(UserModel user) async {
    try {
      await ApiClient.database.createDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.userCollectionId,
          documentId: user.id ?? ID.unique(),
          data: user.toMap());
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

  Future<String?> updateUserData(UserModel user, String id) async {
    try {
      final result = await ApiClient.database.updateDocument(
        databaseId: Env.dataBaseId,
        collectionId: Env.userCollectionId,
        documentId: id,
        data: user.toMap(),
      );
      Logger().d("helllllllllllllllllllllllll");
      Logger().f(result);

      return null;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.toString();
    } catch (e) {
      Logger().e(e);
      return e.toString();
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      final user =
          await ref.read(authControllerProvider.notifier).currentUser();

      final userId = user?.$id;
      final document = await ApiClient.database.getDocument(
        databaseId: Env.dataBaseId,
        collectionId: Env.userCollectionId,
        documentId: userId ?? "",
      );
      Logger().f("User data retreived");
      return UserModel.fromMap(document.data);
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
