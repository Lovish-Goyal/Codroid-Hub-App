import 'package:appwrite/models.dart' as model;
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/auth/provider/user_database_provider.dart';
import 'package:codroid_hub/auth/provider/user_provider.dart';
import 'package:codroid_hub/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController();
});

FutureProvider<model.Account?> currentUserProvider =
    FutureProvider<model.Account?>((ref) {
  return ref.watch(authControllerProvider.notifier).currentUser();
});

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  final ProviderContainer _ref = ProviderContainer();
  void signUp(UserModel user, String pass, BuildContext context) async {
    state = true;
    final res = await _ref.read(authServicesProvider).signUp(user.email, pass);
    _ref.read(userDatabaseProvider).saveUserData(user);
    state = false;
    if (res == null) {
      if (!mounted) return;
      showSnackBar(context, "Account Created Successfully");
    } else {
      if (!mounted) return;
      showSnackBar(context, res.toString());
    }
  }

  void login(String email, String pass, BuildContext context) async {
    state = true;
    final res = await _ref.read(authServicesProvider).signIn(email, pass);
    state = false;
    if (res == null) {
      if (!mounted) return;
      context.go('/home');
      showSnackBar(context, "login Successfully");
    } else {
      if (!mounted) return;
      showSnackBar(context, res.toString());
    }
  }

  Future<model.Account?> currentUser() =>
      _ref.read(authServicesProvider).getCurrentUser();

  void logout(BuildContext context) async {
    final res = await _ref.read(authServicesProvider).logout();
    if (res == null) {
      if (!mounted) return;
      showSnackBar(context, "logout Successfully");
    } else {
      if (!mounted) return;
      showSnackBar(context, res.toString());
    }
    context.go('/login');
  }
}
