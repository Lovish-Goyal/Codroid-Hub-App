import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/end_drawer.dart';

class MobServices extends ConsumerStatefulWidget {
  const MobServices({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServicesState();
}

class _ServicesState extends ConsumerState<MobServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          "Our Services",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // web development
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://miro.medium.com/v2/resize:fit:1200/0*M4bxiCIjcTK-2Xr6.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Web development",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),

            // Cyber security
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://miro.medium.com/v2/resize:fit:1080/0*BRwAoKDQMpVtGYMU.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Cyber Security",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),

            // Internet Of things
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://www.simplilearn.com/ice9/free_resources_article_thumb/everything-you-need-to-know-about-iot-applications.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Internet Of Things",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),

            // Cloud Computing
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://images.squarespace-cdn.com/content/v1/58d20c79725e25b221549193/1515745250847-5FRYEZ3KFE1F8CHHIV39/cloud-integration-services.jpeg?format=2500w",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Cloud Computing",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),

            // Artificial Intelligence
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://www.springboard.com/blog/wp-content/uploads/2022/02/is-ai-hard-to-learn-scaled.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Artificial Inteligence",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),

            // Data Science
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://cdn.analyticsvidhya.com/wp-content/uploads/2023/04/Data-Science-Innovations.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Data Science",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: const Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      drawer: const SizedBox(width: 220, child: EndDrawer()),
    );
  }
}
