import 'package:codroid_hub/modules/cart/provider/cart_controller_provider.dart';
import 'package:codroid_hub/modules/courses/models/course_model.dart';
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
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 15, 0),
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
                const SizedBox(height: 8),
                Container(
                  child: Text(
                    "Price: ${course.price.toString()}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  child: Text(
                    "Duration: 4-6 Weeks",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  child: Text(
                    "Instructor: ${course.instructor}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        "ADD TO CART",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .addItemToCart(course.id ?? "", context);
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

class MobCourseCard extends ConsumerWidget {
  final CourseModel course;
  const MobCourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 380,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                course.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Price: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "${course.price.toString()}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                      Text(
                        "Duration: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "4-6 Weeks",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                      Text(
                        "Instructor: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "${course.instructor}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .addItemToCart(course.id ?? "", context);
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
            ),
          ],
        ),
      ),
    );
  }
}
