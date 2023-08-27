import 'package:codroid_hub/Screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../widgets/cards/addition_feature_card.dart';
import '../widgets/course_container.dart';
import '../widgets/team_carousel.dart';
import '../widgets/end_drawer.dart';
import '../widgets/cards/feature_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;

  final pages = [
    const Text("data"),
    const Text("data"),
    const Text("data"),
    const Text("data")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Row(
              children: [
                Text(
                  "CodroidHub Pvt. Ltd.",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            if (MediaQuery.of(context).size.width > 700)
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "contact us",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "About us",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Our Team",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "services",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage("assets/images/codroid.jpg"),
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
                                  fontSize: 50,
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
          Container(
              color: Colors.blue[500],
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Meet Our Team",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  CarouselImages()
                ],
              )),
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
      bottomNavigationBar: (MediaQuery.of(context).size.width < 600)
          ? buildMyNavBar(context)
          : null,
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
