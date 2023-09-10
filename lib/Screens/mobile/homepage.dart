import 'package:carousel_slider/carousel_slider.dart';
import 'package:codroid_hub/widgets/end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/appbar.dart';
import 'courses.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  _launchWhatsapp() async {
    var phone = "+918607605196";
    var url = Uri.parse(
        "https://wa.me/$phone?text=Hey buddy, try this super cool new app!");
    var whatsappAndroid = Uri.parse(
        "whatsapp://send?phone=$phone&text=hello🖐️ Welcome to our app");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      await launchUrl(whatsappAndroid);
    }
  }

  final TextEditingController pass = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black,
          title: appBarhelper(context)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/codroid.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/home2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Our Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const RowItems(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Our Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Homeservices(
                      icon: FontAwesomeIcons.computer,
                      title: "Web development",
                    ),
                    Homeservices(
                      icon: Icons.security_outlined,
                      title: "Cyber Security",
                    ),
                    Homeservices(
                      icon: FontAwesomeIcons.link,
                      title: "Blockchain",
                    ),
                    Homeservices(
                      icon: FontAwesomeIcons.robot,
                      title: "AI/ML Services",
                    ),
                    Homeservices(
                      icon: FontAwesomeIcons.productHunt,
                      title: "Product Design",
                    ),
                    Homeservices(
                      icon: FontAwesomeIcons.personCircleCheck,
                      title: "Dedicated Team",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const SizedBox(width: 220, child: EndDrawer()),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        backgroundColor: Colors.green.shade600,
        onPressed: _launchWhatsapp,
        child: const FaIcon(FontAwesomeIcons.whatsapp),
      ),
    );
  }
}

class Homeservices extends StatelessWidget {
  final IconData icon;
  final String title;
  const Homeservices({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.alphaBlend(const Color.fromARGB(255, 39, 146, 176),
          const Color.fromARGB(238, 33, 205, 243)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 150,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Icon(
                  icon,
                  color: Colors.white,
                  size: 70,
                ))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
