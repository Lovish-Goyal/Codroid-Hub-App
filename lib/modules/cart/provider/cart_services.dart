import 'package:appwrite/appwrite.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/auth/provider/user_database_provider.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/courses/model/course_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final cartServicesProvider = Provider((ref) => CartServices());

class CartServices {
  Future<List<CourseModel>?> getCartItemsList(List<String> listOfIds) async {
    List<CourseModel> cartItems = [];
    try {
      for (var id in listOfIds) {
        final cartItem = await ApiClient.database.getDocument(
            databaseId: Env.dataBaseId,
            collectionId: Env.courseCollectionId,
            documentId: id);
        CourseModel item = CourseModel.fromMap(cartItem.data);
        cartItems.add(item);
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
      final res = await ApiClient.database.getDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.userCollectionId,
          documentId: userId);

      final userDocuments = UserModel.fromMap(res.data);

      if (!userDocuments.cart.contains(cartItemId)) {
        userDocuments.cart.add(cartItemId);
        UserDatabaseServices().updateUserData(userDocuments, userId);
      }

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
      final res = await ApiClient.database.getDocument(
          databaseId: Env.dataBaseId,
          collectionId: Env.userCollectionId,
          documentId: userId);

      final userDocuments = UserModel.fromMap(res.data);

      if (!userDocuments.cart.contains(cartItemId)) {
        userDocuments.cart.remove(cartItemId);
        UserDatabaseServices().updateUserData(userDocuments, userId);
      }

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
