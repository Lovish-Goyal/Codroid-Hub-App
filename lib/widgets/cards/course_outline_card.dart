import 'package:codroid_hub/modules/courses/models/course_outline_model.dart';
import 'package:flutter/material.dart';

class CourseOutlineCard extends StatelessWidget {
  final CourseOutlineModel courseOutline;
  final int index;
  const CourseOutlineCard({
    Key? key,
    required this.courseOutline,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          "${index + 1} ${courseOutline.mainOutline}",
          textScaleFactor: 1.2,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          for (var i = 0; i < courseOutline.subOutline.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    courseOutline.subOutline[i],
                    style: const TextStyle(),
                  ),
                ),
              ],
            )
        ]);

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       courseOutline.mainOutline,
    //       textScaleFactor: 1.4,
    //       style: const TextStyle(
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     for (var i = 0; i < courseOutline.subOutline.length; i++)
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text(
    //           courseOutline.subOutline[i],
    //           style: const TextStyle(),
    //         ),
    //       ),
    //   ],
    // );
  }
}
