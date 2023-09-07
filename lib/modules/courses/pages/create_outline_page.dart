import 'package:codroid_hub/modules/courses/models/course_outline_model.dart';
import 'package:codroid_hub/modules/courses/provider/course_services_provider.dart';
import 'package:codroid_hub/utils/string_to_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateOutlinePage extends ConsumerStatefulWidget {
  final String courseId;
  const CreateOutlinePage({super.key, required this.courseId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateOutlinePageState();
}

class _CreateOutlinePageState extends ConsumerState<CreateOutlinePage> {
  final TextEditingController _mainOutlineController = TextEditingController();
  final TextEditingController _subOutlineController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mainOutlineController.dispose();
    _subOutlineController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courseDatabaseServices = ref.watch(courseDatabaseProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Create Outline",
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "while creating subOutline, please add dot",
                    ),
                    TextSpan(
                      text: " ' . ' ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:
                            " at the end of the each line to make it a list of sub outline")
                  ], style: TextStyle(color: Colors.red)),
                  textScaleFactor: 1.5,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text("Add Outline"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _mainOutlineController,
                          decoration: const InputDecoration(
                            labelText: "Main Outline",
                          ),
                        ),
                        TextFormField(
                          controller: _subOutlineController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: "Sub Outline",
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              final courseOutline = CourseOutlineModel(
                                  mainOutline: _mainOutlineController.text,
                                  subOutline:
                                      _subOutlineController.text.toList(),
                                  courseId: widget.courseId);

                              courseDatabaseServices
                                  .createOutline(courseOutline);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Add",
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }
}
