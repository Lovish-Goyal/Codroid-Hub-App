import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/auth/provider/user_database_provider.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final cartServicesProvider = Provider((ref) => CartServices(ref: ref));

class CartServices {
  final ProviderRef ref;
  CartServices({required this.ref});
  Future<List<CourseModel>?> getCartItemsList() async {
    final userData = await ref.watch(userDatabaseProvider).getUserData();

    List<CourseModel> cartItems = [];
    try {
      final cartIds = userData?.cart ?? [];
      if (cartIds.isNotEmpty) {
        for (var id in cartIds) {
          final cartItem = await ApiClient.database.getDocument(
              databaseId: Env.dataBaseId,
              collectionId: Env.courseCollectionId,
              documentId: id);
          CourseModel item = CourseModel.fromMap(cartItem.data);
          cartItems.add(item);
        }
      }
      return cartItems;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future addItemToCart(String userId, String cartItemId) async {
    try {
      final userData = await ref.watch(userDatabaseProvider).getUserData();
      if (!userData!.cart.contains(cartItemId)) {
        userData.cart.add(cartItemId);
        UserDatabaseServices(ref: ref).updateUserData(userData, userId);
      }
      // final res = await ApiClient.database.getDocument(
      //     databaseId: Env.dataBaseId,
      //     collectionId: Env.userCollectionId,
      //     documentId: userId);

      // final userDocuments = UserModel.fromMap(res.data);

      // if (!userDocuments.cart.contains(cartItemId)) {
      //   userDocuments.cart.add(cartItemId);
      //   UserDatabaseServices(ref: ref).updateUserData(userDocuments, userId);
      // }

      Logger().i("Item added to cart successfully");

      return;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future removeItemFromCart(String userId, String cartItemId) async {
    try {
      final userData = await ref.watch(userDatabaseProvider).getUserData();
      userData?.cart.remove(cartItemId);
      UserDatabaseServices(ref: ref).updateUserData(userData!, userId);

      // final res = await ApiClient.database.getDocument(
      //     databaseId: Env.dataBaseId,
      //     collectionId: Env.userCollectionId,
      //     documentId: userId);

      // final userDocuments = UserModel.fromMap(res.data);

      // if (!userDocuments.cart.contains(cartItemId)) {
      //   userDocuments.cart.remove(cartItemId);
      //   UserDatabaseServices(ref: ref).updateUserData(userDocuments, userId);
      // }

      Logger().i("Item removed from cart successfully");

      return;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
