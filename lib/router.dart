import 'package:codroid_hub/Screens/home_page.dart';
import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/auth/pages/login_page.dart';
import 'package:codroid_hub/auth/pages/signup_page.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider);
  return GoRouter(initialLocation: RouteKey.home, routes: [
    GoRoute(
      path: RouteKey.root,
      builder: (context, state) => user.when(
          data: (user) {
            if (user != null) {
              return const Homepage();
            }
            return const LoginView();
          },
          error: ((err, st) => const Center(
                child: Text("Page Not found"),
              )),
          loading: () => const LoadingPage()),
    ),
    GoRoute(
      path: RouteKey.home,
      builder: (context, state) => const Homepage(),
    ),
    GoRoute(
      path: RouteKey.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouteKey.signup,
      builder: (context, state) => const SignUpView(),
    ),
  ]);
});

class RouteKey {
  static const String root = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
}
