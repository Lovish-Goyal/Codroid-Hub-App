import 'package:appwrite/models.dart' as model;
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/auth/provider/user_database_provider.dart';
import 'package:codroid_hub/auth/provider/user_provider.dart';
import 'package:codroid_hub/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, model.Account?>((ref) {
  return AuthController(ref: ref);
});

FutureProvider<model.Account?> currentUserProvider =
    FutureProvider<model.Account?>((ref) {
  return AuthController(ref: ref).currentUser();
});

class AuthController extends StateNotifier<model.Account?> {
  AuthController({required Ref ref})
      : _ref = ref,
        super(null);

  final Ref _ref;

  void signUp(UserModel user, String pass, BuildContext context) async {
    // state = true;
    final res = await _ref
        .read(authServicesProvider)
        .signUp(user.email, pass, user.id!);

    _ref.read(userDatabaseProvider).saveUserData(user);
    // state = false;
    if (res == null) {
      if (!mounted) return;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Success"),
              content: const Text("SignUp Successfully. Login to Continue"),
              actions: [
                ElevatedButton(
                    onPressed: () => context.go("/login"),
                    child: const Text("OK"))
              ],
            );
          });
      // showSnackBar(context, "Account Created Successfully. Login to continue");
    } else {
      if (!mounted) return;
      showSnackBar(context, res.toString());
    }
  }

  void login(String email, String pass, BuildContext context) async {
    // state = true;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        });
    final res = await _ref.read(authServicesProvider).signIn(email, pass);
    // state = await _ref.read(authServicesProvider).getCurrentUser();
    // _ref.refresh(authControllerProvider);
    // _ref.refresh(currentUserProvider);
    // ignore: unused_result
    _ref.refresh(authServicesProvider);
    if (res == null) {
      if (!mounted) return;
      // context.go('/');
      showSnackBar(context, "login Successfully");
    } else {
      if (!mounted) return;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(child: Text("Invalid Username or password"));
          });
      showSnackBar(context, res.toString());
    }
  }

  Future<model.Account?> currentUser() async {
    final account = await _ref.watch(authServicesProvider).getCurrentUser();

    // state = account;

    return account;
  }

  void logout(BuildContext context) async {
    final res = await _ref.read(authServicesProvider).logout();

    // ignore: unused_result
    _ref.refresh(authServicesProvider);
    if (res == null) {
      if (!mounted) return;
      showSnackBar(context, "logout Successfully");
    } else {
      if (!mounted) return;
      showSnackBar(context, res.toString());
    }
  }
}
