import 'package:codroid_hub/modules/courses/provider/course_provider.dart';
import 'package:codroid_hub/widgets/cards/course_card.dart';
import 'package:codroid_hub/widgets/end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobCourses extends ConsumerStatefulWidget {
  const MobCourses({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobCoursesState();
}

class _MobCoursesState extends ConsumerState<MobCourses> {
  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(courseListProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          "Courses",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: courses.when(
          data: (data) => SingleChildScrollView(
                child: GridView.count(
                  childAspectRatio: .80,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  shrinkWrap: true,
                  children: data
                      .map((course) => CourseCard(
                            course: course,
                          ))
                      .toList(),
                ),
              ),
          error: (error, stack) => Center(
                child: Text(error.toString()),
              ),
          loading: (() => const Center(
                child: CircularProgressIndicator(),
              ))),
      drawer: const SizedBox(width: 220, child: EndDrawer()),
    );
  }
}

class RowItems extends ConsumerWidget {
  const RowItems({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseListProvider);
    return courses.when(
        data: (data) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: data
                    .map((course) => MobCourseCard(
                          course: course,
                        ))
                    .toList(),
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
