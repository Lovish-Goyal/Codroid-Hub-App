import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../widgets/appbar.dart';
import '../../widgets/end_drawer.dart';
import '../../widgets/footer.dart';

class Services extends ConsumerStatefulWidget {
  const Services({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServicesState();
}

class _ServicesState extends ConsumerState<Services> {
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
            SizedBox(
              height: 400,
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
                                SizedBox(
                                  height: 100,
                                ),
                                Center(
                                  child: Text(
                                    "We Provides a lot of courses",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Container(
                                    width: 1000,
                                    child: const Text(
                                      "Get professional & reliable research oriented solutions to latest technologies. we provides courses based on latest and demanded technology",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 120, left: 30),
                                  child: const Text(
                                    "Welcome to CodroidHub",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 600,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 30),
                                  child: const Text(
                                    "Get professional & reliable research oriented solutions for Data Science and Machine learning business needs. Enjoy stress free decision making.",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ))
                ],
              ),
            ),

            // Web developmment
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width > 1200
                              //     ? 20
                              //     : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Web Development",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Web development technology encompasses a diverse set of tools and languages used to create and maintain websites and web applications. HTML (HyperText Markup Language) provides the basic structure, defining elements like headings, paragraphs, and links. CSS (Cascading Style Sheets) complements HTML, governing layout and visual presentation, ensuring an aesthetically pleasing user interface. JavaScript, a versatile scripting language, enables interactivity, allowing developers to create dynamic, responsive content.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://miro.medium.com/v2/resize:fit:1200/0*M4bxiCIjcTK-2Xr6.jpeg",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),

            // Cyber Security
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://miro.medium.com/v2/resize:fit:1080/0*BRwAoKDQMpVtGYMU.jpeg",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width < 1200 ? 50 : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cyber Security",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Cybersecurity technology constitutes a multifaceted arsenal of tools and practices designed to safeguard digital systems, networks, and sensitive information from cyber threats. Firewalls act as a first line of defense, monitoring and filtering incoming and outgoing traffic to prevent unauthorized access. Antivirus software detects, blocks, and removes malicious software like viruses, worms, and Trojans. Intrusion Detection Systems (IDS) and Intrusion Prevention Systems (IPS) monitor network and system activities for suspicious behavior, alerting or taking action to mitigate potential breaches.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                  ])
                ],
              ),
            ),

            // Internet of things
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width > 1200
                              //     ? 20
                              //     : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Internet Of Things",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "The Internet of Things (IoT) encompasses a revolutionary technological paradigm that connects physical objects, devices, and systems to the internet, allowing them to communicate and exchange data. IoT relies on a network of sensors, actuators, and embedded technology to collect and transmit information from the physical world to digital systems. These sensors can monitor a wide array of variables such as temperature, humidity, location, and more.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://www.simplilearn.com/ice9/free_resources_article_thumb/everything-you-need-to-know-about-iot-applications.jpg",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),

            // Cloud Computing
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://images.squarespace-cdn.com/content/v1/58d20c79725e25b221549193/1515745250847-5FRYEZ3KFE1F8CHHIV39/cloud-integration-services.jpeg?format=2500w",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width < 1200 ? 50 : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cloud Computing",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Cloud computing is a transformative technology that allows users to access and utilize computing resources over the internet, without the need for physical hardware. It relies on a network of remote servers, often hosted by third-party providers, to store and process data, run applications, and deliver services on-demand. Virtualization technology plays a crucial role, allowing multiple virtual machines to run on a single physical server, maximizing resource utilization.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                  ])
                ],
              ),
            ),

            // Artificial Inteligence
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width > 1200
                              //     ? 20
                              //     : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Artificial Intelligence",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Artificial Intelligence (AI) is a cutting-edge technology that empowers machines to mimic human cognitive functions, enabling them to learn, reason, and make decisions. Machine learning, a subset of AI, involves algorithms that improve their performance over time by processing vast amounts of data. Deep learning, a specialized form of machine learning, employs artificial neural networks with multiple layers to process complex information.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://www.springboard.com/blog/wp-content/uploads/2022/02/is-ai-hard-to-learn-scaled.jpg",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),

            // Data Science
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xl: 7,
                      lg: 6,
                      md: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://cdn.analyticsvidhya.com/wp-content/uploads/2023/04/Data-Science-Innovations.jpeg",
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                        xl: 5,
                        lg: 6,
                        md: 12,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width > 950
                                  ? 50
                                  : 0,
                              // top: MediaQuery.of(context).size.width < 1200 ? 50 : 0,
                              top: 20,
                              bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Data Science",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Data science technology is a multidisciplinary field that employs a range of tools and techniques to extract insights and knowledge from large volumes of data. At its core, programming languages like Python and R serve as foundational tools for data manipulation, analysis, and visualization. Data scientists also leverage powerful libraries and frameworks such as Pandas, NumPy, and SciPy for efficient data handling and mathematical computations.",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                  ])
                ],
              ),
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
