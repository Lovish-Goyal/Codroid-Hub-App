import 'package:codroid_hub/widgets/appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../widgets/cards/addition_feature_card.dart';
import '../widgets/end_drawer.dart';
import '../widgets/team_carousel.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black,
          title: appBarhelper(context)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[600],
                child: Column(
                  children: [],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: ResponsiveGridRow(
                  children: [
                  ResponsiveGridCol(
                    xl: 5,
                    lg: 5,
                    child: Container(
                      width: 400,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "About Us",
                              style: TextStyle(fontSize: 50, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30,bottom: 20),
                            child: Text(
                              "Empowering Education through Technological Advancements",
                              style: TextStyle(fontSize: 40, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "We are a leading provider of IT services for educational organizations across the country. Our team of highly trained professionals is dedicated to helping schools and universities leverage technology to improve their operations and optimize the learning experience for students.",
                            style: TextStyle(color: Colors.grey[600],fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Cordoidhub Private Limited has also become an important player in the government’s Digital India initiative. The company is actively involved in projects that use AI and big data to improve access to healthcare, education, and other services for rural and disadvantaged populations.",
                            style: TextStyle(color: Colors.grey[600],fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Through its products and services, the company is helping to empower people and create a more equitable society. Cordoidhub Private Limited is a great example of how a college-level technical society can grow into a successful company with a positive impact on society.",
                            style: TextStyle(color: Colors.grey[600],fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xl: 7,
                    lg: 7,
                    child: Container(
                      // height: 1000,
                      width: double.infinity,
                        margin: EdgeInsets.all(20),
                        child: Image.asset("images/home.jpeg",),
                      ),
                    ),
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
              width: 600,
              margin: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Discover Trust Team and",
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      "Our Experts",
                      style: TextStyle(fontSize: 50),
                    ),
                ],
              ),
            ),
            const CarouselImages(),
            const SizedBox(
              height: 20,
            ),
            if (kIsWeb)
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
