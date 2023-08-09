import 'package:codroid_hub/Screens.dart/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: RouteKey.home, routes: [
    GoRoute(
      path: RouteKey.home,
      builder: (context, state) => const HomePage(),
    ),
  ]);
});

class RouteKey {
  static const String home = '/';
}
