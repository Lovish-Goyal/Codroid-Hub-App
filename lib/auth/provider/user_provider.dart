import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:codroid_hub/appwrite.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final authServicesProvider = Provider((ref) {
  return AuthServices();
});

class AuthServices {
  Future signUp(String email, String password, String userId) async {
    try {
      final response = await ApiClient.account
          .create(userId: userId, email: email, password: password);

      Logger().i(response.email);
      return null;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.message;
    } catch (e) {
      Logger().e(e);
      return e;
    }
  }

  Future signIn(String email, String password) async {
    try {
      final response = await ApiClient.account
          .createEmailSession(email: email, password: password);

      Logger().i(response);
      return null;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.message;
    } catch (e) {
      Logger().e(e);
      return e.toString();
    }
  }

  Future<model.Account?> getCurrentUser() async {
    try {
      return await ApiClient.account.get();
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<String?> logout() async {
    try {
      await ApiClient.account.deleteSession(sessionId: 'current');

      return null;
    } on AppwriteException catch (e) {
      Logger().e(e.message);
      return e.message;
    } catch (e) {
      Logger().e(e);
      return e.toString();
    }
  }
}
