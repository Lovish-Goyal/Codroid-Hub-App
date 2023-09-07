import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/provider/course_provider.dart';
import 'package:codroid_hub/modules/courses/provider/course_services_provider.dart';
import 'package:codroid_hub/utils/string_to_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCoursePage extends ConsumerStatefulWidget {
  const CreateCoursePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCoursePageState();
}

class _CreateCoursePageState extends ConsumerState<CreateCoursePage> {
  final _courseNameController = TextEditingController();
  final _instructorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _courseOutlineController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _courseNameController.dispose();
    _instructorController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imgUrlController.dispose();
    _courseOutlineController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courseServices = ref.watch(courseDatabaseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _courseNameController,
                decoration: const InputDecoration(labelText: 'Course Name'),
              ),
              TextFormField(
                controller: _instructorController,
                decoration: const InputDecoration(labelText: 'Instructor'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'price'),
                controller: _priceController,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
              ),
              TextFormField(
                controller: _imgUrlController,
                decoration: const InputDecoration(labelText: 'imgUrl'),
                maxLines: 4,
              ),
              // TextFormField(
              //   controller: _courseOutlineController,
              //   decoration: const InputDecoration(labelText: 'Course Outline'),
              //   maxLines: 4,
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final CourseModel course = CourseModel(
                    title: _courseNameController.text,
                    instructor: _instructorController.text,
                    imgUrl: _imgUrlController.text,
                    price: int.parse(_priceController.text),
                    description: _descriptionController.text,
                    // courseOutline: _courseOutlineController.text.toList(),
                  );
                  courseServices.createCourses(
                    course,
                  );
                  // ignore: unused_result
                  ref.refresh(courseListProvider);
                },
                child: const Text('Add Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
