import 'package:codroid_hub/modules/members/pages/members_page.dart';
import 'package:codroid_hub/widgets/appbar.dart';
import 'package:codroid_hub/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../widgets/cards/addition_feature_card.dart';
import '../../widgets/course_container.dart';
import '../../widgets/end_drawer.dart';
import '../../widgets/cards/feature_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black87,
          title: appBarhelper(context)),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage("assets/images/myhome.jpg"),
                  fit: BoxFit.fill,
                )),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 180),
                  child: (MediaQuery.of(context).size.width > 600)
                      ? const Column(
                          children: [
                            Text(
                              "Welcome to Codroid Hub",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Let`s start your journey with the best company codroid hub",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ],
                        )
                      : const Column(
                          children: [
                            Text(
                              "Welcome to Codroid Hub",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Let`s start your journey with the best company codroid hub",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                )),
            Container(
              margin: const EdgeInsets.only(
                top: 450,
              ),
              child: ResponsiveGridRow(children: [
                ResponsiveGridCol(
                    xl: 4,
                    lg: 4,
                    md: 4,
                    child: const FeatureCard(
                      headingText: "Modern Courses",
                      color: Colors.amber,
                      detailText:
                          "we are offering latest tachnology based courses.",
                      icon: Icons.add_box_outlined,
                    )),
                ResponsiveGridCol(
                    xl: 4,
                    lg: 4,
                    md: 4,
                    child: const FeatureCard(
                      headingText: "Afforadable Costs",
                      color: Colors.purple,
                      detailText:
                          "The courses are based on latest technology and available in low cost.",
                      icon: Icons.monitor_heart,
                    )),
                ResponsiveGridCol(
                  xl: 4,
                  lg: 4,
                  md: 4,
                  child: const FeatureCard(
                      headingText: "Reach Programs",
                      color: Colors.green,
                      detailText:
                          "Programs are based on latest technology and reach to evry person easily.",
                      icon: Icons.favorite_border),
                )
              ]),
            )
          ]),
          const MembersPage(),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(children: [
              Image.asset(
                "assets/images/image1.png",
                color: const Color.fromARGB(237, 255, 235, 59),
              ),
              const Text(
                "Selling Top Courses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 3.5,
                textAlign: TextAlign.center,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              )
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Our perks",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 3.5,
            textAlign: TextAlign.center,
          ),
          ResponsiveGridRow(children: [
            ResponsiveGridCol(
                xl: 3,
                lg: 4,
                md: 4,
                child: const AdditionalFeaturesCard(
                  headingText: "50+",
                  subHeadingText: "Faculty",
                  icon: Icons.people,
                  color: Colors.blue,
                )),
            ResponsiveGridCol(
                xl: 3,
                lg: 4,
                md: 4,
                child: const AdditionalFeaturesCard(
                  headingText: "10000+",
                  subHeadingText: "Downloads",
                  icon: Icons.download,
                  color: Colors.blue,
                )),
            ResponsiveGridCol(
                xl: 3,
                lg: 4,
                md: 4,
                child: const AdditionalFeaturesCard(
                  headingText: "5000+",
                  subHeadingText: "Active Install",
                  icon: Icons.install_mobile,
                  color: Colors.blue,
                )),
            ResponsiveGridCol(
                xl: 3,
                lg: 4,
                md: 4,
                child: const AdditionalFeaturesCard(
                  headingText: "50+",
                  subHeadingText: "Courses",
                  icon: Icons.book_rounded,
                  color: Colors.blue,
                )),
          ]),
          const CoursesContainer(),
          (MediaQuery.of(context).size.width > 700)
              ? const Footer()
              : const MobileFooter()
        ]),
      ),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}
