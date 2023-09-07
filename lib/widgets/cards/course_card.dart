import 'package:codroid_hub/auth/provider/firebase_auth_services.dart';
import 'package:codroid_hub/modules/cart/provider/cart_controller_provider.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/pages/course_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CourseCard extends ConsumerWidget {
  const CourseCard({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            course.imgUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  course.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        ref.read(cartProvider.notifier).addItemToCart(
                            "64eb8bcd4b906865298a", course.id ?? "");
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "EXPLORE",
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        context.push("/courseDetails", extra: course);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
