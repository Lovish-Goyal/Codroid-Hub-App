import 'package:codroid_hub/widgets/course_container.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/end_drawer.dart';
import '../widgets/footer.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black87,
        title: AppBarhelper(context)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoursesContainer(),
            (MediaQuery.of(context).size.width > 700)
              ? const Footer()
              : const MobileFooter()
          ],
        ),
      ),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}