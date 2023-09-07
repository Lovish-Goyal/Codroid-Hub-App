import 'package:codroid_hub/widgets/appbar.dart';
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
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/codroid.jpg"), fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Empowering Education through Technological Advancements",
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ResponsiveGridRow(
                          children: [
                            ResponsiveGridCol(
                                xl: 4,
                                lg: 4,
                                md: 6,
                                sm: 6,
                                xs: 12,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: const Text(
                                    "We are a leading provider of IT services for educational organizations across the country. Our team of highly trained professionals is dedicated to helping schools and universities leverage technology to improve their operations and optimize the learning experience for students.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            ResponsiveGridCol(
                                xl: 4,
                                lg: 4,
                                md: 6,
                                sm: 6,
                                xs: 12,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: const Text(
                                    "Cordoidhub Private Limited has also become an important player in the government’s Digital India initiative. The company is actively involved in projects that use AI and big data to improve access to healthcare, education, and other services for rural and disadvantaged populations.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            ResponsiveGridCol(
                                xl: 4,
                                lg: 4,
                                md: 6,
                                sm: 6,
                                xs: 12,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: const Text(
                                    "Through its products and services, the company is helping to empower people and create a more equitable society. Cordoidhub Private Limited is a great example of how a college-level technical society can grow into a successful company with a positive impact on society.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
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
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "Discover Trust Team and Our Experts",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            const CarouselImages(),
            const SizedBox(
              height: 20,
            ),
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
