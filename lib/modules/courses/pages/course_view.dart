// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:codroid_hub/widgets/cards/course_outline_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/provider/course_provider.dart';

import 'package:codroid_hub/utils/loading_page.dart';
import 'package:go_router/go_router.dart';

class CourseDetailPage extends ConsumerWidget {
  final CourseModel course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseOutlineList =
        ref.watch(courseOutlineListProvider(course.id ?? ""));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                course.imgUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title: ${course.title}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Instructor: ${course.instructor}'),
                    const SizedBox(height: 8),
                    Text('Price: \$${course.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 8),
                    const Text('Description:'),
                    Text(course.description),
                    const SizedBox(height: 8),
                    courseOutlineList.when(
                      data: (courseOutline) {
                        if (courseOutline.isEmpty) {
                          return const Center(
                            child: Text('No Outline available',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          );
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: courseOutline.length,
                          itemBuilder: (context, index) {
                            return CourseOutlineCard(
                              courseOutline: courseOutline[index],
                              index: index,
                            );
                          },
                        );
                      },
                      error: ((err, st) => Center(
                            child: Text(err.toString()),
                          )),
                      loading: (() => const Loder()),
                    ),
                    Align(
                      child: TextButton(
                        onPressed: () => context.pushNamed("createOutlinePage",
                            pathParameters: {"courseId": course.id ?? ""}),
                        child: const Text(
                          "Add Outlines",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
