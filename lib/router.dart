import 'dart:developer';

import 'package:codroid_hub/Screens/mobile/about.dart';
import 'package:codroid_hub/Screens/web/about.dart';
import 'package:codroid_hub/Screens/mobile/contact.dart';
import 'package:codroid_hub/Screens/web/contact.dart';
import 'package:codroid_hub/Screens/web/courses.dart';
import 'package:codroid_hub/Screens/web/home_page.dart';
import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/auth/pages/login.dart';
import 'package:codroid_hub/auth/pages/signup.dart';
import 'package:codroid_hub/modules/cart/pages/cart_page.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/pages/course_view.dart';
import 'package:codroid_hub/modules/courses/pages/create_course_page.dart';
import 'package:codroid_hub/modules/courses/pages/create_outline_page.dart';
import 'package:codroid_hub/widgets/course_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';

import 'Screens/mobile/bottombar.dart';
import 'Screens/web/services.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider).value;
  return GoRouter(initialLocation: RouteKey.home, routes: [
    GoRoute(
      path: RouteKey.home,
      builder: (context, state) =>
          kIsWeb ? const Homepage() : const BottomNavBar(),
    ),
    // builder: (context, state) =>
    //   user.when(
    //       data: (user) {
    //         if (user != null) {
    //           return const Homepage();
    //         }
    //         return const LoginView();
    //       },
    //       error: ((err, st) => const Center(
    //             child: Text("Page Not found"),
    //           )),
    //       loading: () => const LoadingPage()),
    // ),,
    GoRoute(
      path: RouteKey.about,
      builder: (context, state) => 
      kIsWeb ? const AboutPage() : const MobAboutPage(),
    ),
    GoRoute(
      path: RouteKey.contact,
      builder: (context, state) =>
          kIsWeb ? const WebContactPage() : const MobContactPage(),
    ),
    GoRoute(
      path: RouteKey.courses,
      builder: (context, state) => Courses()
      // const Courses(),
    ),
     GoRoute(
      path: RouteKey.services,
      builder: (context, state) => const Services()
      // const Courses(),
    ),
    GoRoute(
        path: RouteKey.cart,
        builder: (context, state) {
          Logger().f(user);
          return user == null
              ? const LoginCustomAlert()
              : (kIsWeb ? WebCartpage() : const MobileCartPage()) ;
        }),
    GoRoute(
      path: RouteKey.addCourses,
      builder: (context, state) => const CreateCoursePage(),
    ),
    GoRoute(
      path: RouteKey.login,
      builder: (context, state) => const LoginCustomAlert(),
    ),
    GoRoute(
      path: RouteKey.signup,
      builder: (context, state) => const SignUpCustomAlertBox(),
    ),
    GoRoute(
      path: RouteKey.courseDetails,
      builder: (context, state) => kIsWeb ?
          CourseDetailPage(course: state.extra as CourseModel) : MobCourseDetailPage(course: state.extra as CourseModel),
    ),
    GoRoute(
        path: "${RouteKey.createOutlinePage}/:courseId",
        name: "createOutlinePage",
        builder: (context, state) => CreateOutlinePage(
            courseId: state.pathParameters['courseId'] ?? "")),
  ]);
});

class RouteKey {
  static const String home = '/';
  static const String login = '/login';
  static const String services = '/services';
  static const String signup = '/signup';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String courses = '/courses';
  static const String cart = '/cart';
  static const String addCourses = '/addCourses';
  static const String courseDetails = '/courseDetails';
  static const String createOutlinePage = '/createOutlinePage';
}
