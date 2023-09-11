import 'package:codroid_hub/modules/courses/provider/course_provider.dart';
import 'package:codroid_hub/widgets/cards/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CoursesContainer extends ConsumerWidget {
  const CoursesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseListProvider);

    return courses.when(
        data: (data) => Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black87,
                // borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data.length.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textScaleFactor: 10,
                      textAlign: TextAlign.center),
                  const Text(
                    "Premium Courses",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textScaleFactor: 3.5,
                    textAlign: TextAlign.center,
                  ),
                  // const Text("Check Our Courses",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //     textScaleFactor: 2,
                  //     textAlign: TextAlign.center),
                  ResponsiveGridRow(
                    children: data
                        .map((course) => ResponsiveGridCol(
                              xl: 3,
                              lg: 4,
                              md: 4,
                              child: CourseCard(
                                course: course,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
        error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
        loading: (() => const Center(
              child: CircularProgressIndicator(),
            )));
  }
}
