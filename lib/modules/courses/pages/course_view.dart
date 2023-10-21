import 'package:codroid_hub/widgets/appbar.dart';
import 'package:codroid_hub/widgets/cards/course_outline_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codroid_hub/modules/courses/models/course_model.dart';
import 'package:codroid_hub/modules/courses/provider/course_provider.dart';

import 'package:codroid_hub/utils/loading_page.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../widgets/end_drawer.dart';
import '../../../widgets/footer.dart';
import '../../cart/provider/cart_controller_provider.dart';

class CourseDetailPage extends ConsumerWidget {
  final CourseModel course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseOutlineList =
        ref.watch(courseOutlineListProvider(course.id ?? ""));
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Colors.black87,
          title: appBarhelper(context)),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
            child: Text(
              course.title,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xl: 8,
                lg: 12,
                md: 12,
                sm: 12,
                xs: 12,
                child: Image.network(
                  course.imgUrl,
                  // height: 400,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              ResponsiveGridCol(
                  xl: 4,
                  lg: 12,
                  md: 12,
                  sm: 12,
                  xs: 12,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width > 1198 ? 30 : 0,
                        vertical:
                            MediaQuery.of(context).size.width < 1198 ? 20 : 0),
                    // margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Course Details:-",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "Instructor: ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                            Text(
                              course.instructor,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Price: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            Text(
                              '${course.price.toStringAsFixed(2)} /-',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Duration: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            Text(
                              '4-6 Weeks',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Course level: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            Text(
                              'Intermediate',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Organized By: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            Text(
                              'CodroidHub',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .addItemToCart(course.id ?? "", context);
                            },
                            icon: Icon(Icons.shopping_cart),
                            label: Text("ADD TO CART")),
                      ],
                    ),
                  )),
            ]),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                        xl: 8,
                        lg: 12,
                        md: 12,
                        sm: 12,
                        xs: 12,
                        child: Text(
                          course.description,
                          textAlign: TextAlign.justify,
                        )),
                  ])
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: const Text(
              'Course Outline:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ResponsiveGridRow(children: [
            ResponsiveGridCol(
              xl: 8,
              lg: 12,
              md: 12,
              sm: 12,
              xs: 12,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
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
            )
          ]),
          (MediaQuery.of(context).size.width > 700)
              ? const Footer()
              : const MobileFooter()
        ],
      )),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}
