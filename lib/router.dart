import 'package:codroid_hub/Screens/about.dart';
import 'package:codroid_hub/Screens/contact.dart';
import 'package:codroid_hub/Screens/courses.dart';
import 'package:codroid_hub/Screens/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // final user = ref.watch(currentUserProvider);
  return GoRouter(initialLocation: RouteKey.home, routes: [
    GoRoute(
      path: RouteKey.home,
      builder: (context, state) => const Homepage(),
      // builder: (context, state) => showAlertDialogLogin(context),
      // user.when(
      //     data: (user) {
      //       if (user != null) {
      //         return const Homepage();
      //       }
      //       return const LoginView();
      //     },
      //     error: ((err, st) => const Center(
      //           child: Text("Page Not found"),
      //         )),
      //     loading: () => const LoadingPage()),
    ),
    GoRoute(
      path: RouteKey.home,
      builder: (context, state) => const Homepage(),
    ),
    GoRoute(
      path: RouteKey.about,
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: RouteKey.contact,
      builder: (context, state) => const ContactPage(),
    ),
    GoRoute(
      path: RouteKey.courses,
      builder: (context, state) => const Courses(),
    ),
  ]);
});

class RouteKey {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String courses = '/courses';
}
