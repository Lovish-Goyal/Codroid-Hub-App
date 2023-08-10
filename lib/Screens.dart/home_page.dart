import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'widgets/addition_feature_card.dart';
import 'widgets/end_drawer.dart';
import 'widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Codroid Hub"),
            if (MediaQuery.of(context).size.width > 700)
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text("Home")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: const Text("contact us")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: const Text("About us")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: const Text("Our Team")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: const Text("services")),
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
                  opacity: 0.9,
                  image: AssetImage("assets/images/codroid.jpg"),
                  fit: BoxFit.fill,
                )),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 180),
                  child: const Column(
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
          ])
        ]),
      ),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}
