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
            SizedBox(
              height: 600,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("images/home.jpeg", fit: BoxFit.cover),
                  ColoredBox(
                      color: Colors.black.withOpacity(0.7) // 0: Light, 1: Dark
                      ),
                  Container(
                      // margin: const EdgeInsets.symmetric(vertical: 180),
                      child: (MediaQuery.of(context).size.width > 800)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 120, left: 60),
                                  child: Text(
                                    "TRUST AND CLIENT FOCUS",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, left: 60),
                                  child: Text(
                                    "Welcome to CodroidHub",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 600,
                                  margin: EdgeInsets.only(top: 20, left: 60),
                                  child: Text(
                                    "Get professional & reliable research oriented solutions for Data Science and Machine learning business needs. Enjoy stress free decision making.",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 100, left: 30),
                                  child: Text(
                                    "TRUST AND CLIENT FOCUS",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, left: 30),
                                  child: Text(
                                    "Welcome to CodroidHub",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 600,
                                  margin: EdgeInsets.only(top: 20, left: 30),
                                  child: Text(
                                    "Get professional & reliable research oriented solutions for Data Science and Machine learning business needs. Enjoy stress free decision making.",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ],
                            ))
                ],
              ),
            ),
            // Container(
            //     height: 600,
            // width: double.infinity,
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //   opacity: 0.8,
            //   image: AssetImage("assets/images/myhome.jpg"),
            //   fit: BoxFit.fill,
            // )),
            //     child: Container(
            //       margin: const EdgeInsets.symmetric(vertical: 180),
            //       child: (MediaQuery.of(context).size.width > 600)
            //           ? Column(
            //               children: [
            //                 Text(
            //                   "Welcome to Codroid Hub",
            //                   style: TextStyle(
            //                       fontSize: 60,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.black),
            //                 ),
            //                 Text(
            //                   "Let`s start your journey with the best company codroid hub",
            //                   style:
            //                       TextStyle(fontSize: 30, color: Colors.black),
            //                 ),
            //               ],
            //             )
            //           : const Column(
            //               children: [
            //                 Text(
            //                   "Welcome to Codroid Hub",
            //                   style: TextStyle(
            //                       fontSize: 40,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.black),
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Text(
            //                   "Let`s start your journey with the best company codroid hub",
            //                   style: TextStyle(color: Colors.black),
            //                 ),
            //               ],
            //             ),
            //     )),
            Container(
              margin: const EdgeInsets.only(
                top: 400,
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
                          "we are offering latest tachnology based courses.These courses reflect the evolving landscape of technology and its impact on various industries. They provide students with practical skills and knowledge to excel in a rapidly changing job market, making them highly relevant in today's digital age.",
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
                          "CodroidHub offers budget-friendly courses, ensuring education is accessible to all. We believe in quality learning without financial strain. Our diverse range of courses caters to various interests and skill levels, empowering individuals to pursue their passions affordably. Join us in revolutionizing education for everyone.",
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
                          "Courses prioritize employee development and skill enhancement. These initiatives offer tailored training, mentorship, and resources to ensure individuals can excel in their roles. By fostering continuous learning , these programs empower employees to reach their highest professional potential.",
                      icon: Icons.favorite_border),
                )
              ]),
            )
          ]),
          Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/aboutpage.jpg"),
              fit: BoxFit.fill,
            )),
            child: Column(
              children: [
                const Text(
                  "Our perks",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
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
          const CoursesContainer(),
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/1406100267/video/colorful-gradient-background.jpg?s=640x640&k=20&c=aG6C38kxW_bTSDmtenLFy3A9DClLhYFwvTIGjfkVW6E="),
              fit: BoxFit.fill,
            )),
            child: Center(
                child: Text(
              "We are professional team, over 5 years of experience passionate about our work",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            )),
          ),
          const MembersPage(),
          (MediaQuery.of(context).size.width > 800)
              ? const Footer()
              : const MobileFooter()
        ]),
      ),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}
