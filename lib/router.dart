import 'package:codroid_hub/Screens.dart/HomePage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteKey.Home,
     routes: [
       GoRoute(
        path: RouteKey.Home,
        builder: (context, state) => HomePage(),
        ),
  ]);
});

class RouteKey {
  static const String Home = '/';
}
