import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

_launchFacebook() async {
  var url = Uri.parse("https://www.facebook.com/codroidhubpvtltd/");
  var android = Uri.parse("fb://page/codroidhubpvtltd/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    await launchUrl(android);
  }
}

_launchTwitter() async {
  var url = Uri.parse("https://twitter.com/codroidhub");
  await launchUrl(url);
}

_launchYouTube() async {
  var url = Uri.parse(
      "https://www.youtube.com/channel/UCh9VyrzUcj4U-i1ZmoklMeQ/videos");
  await launchUrl(url);
}

_launchLinkedin() async {
  var url = Uri.parse("https://in.linkedin.com/company/codroidhub");
  await launchUrl(url);
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.black87,
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
          xl: 3,
          lg: 6,
          md: 6,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text.rich(TextSpan(
                    style: TextStyle(fontSize: 60), //apply style to all
                    children: [
                      TextSpan(
                          text: 'Codroid',
                          style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: 'Hub', style: TextStyle(color: Colors.blue))
                    ])),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Hey, Our company is good and provides a lot of jobs and training in all over the world hurry up guys and takle advantages of it",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Copyright with @codroidhub 2015-2023 | legal | Codroid Hub",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 6,
          md: 6,
          child: Container(
            margin: const EdgeInsets.all(60),
            child: Column(
              children: [
                const Text("Quick Links",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                const Divider(
                  indent: 50,
                  thickness: 3,
                  endIndent: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () => context.go('/'),
                        child: const Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () => context.go('/contact'),
                        child: const Text(
                          "Contact Us",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () => context.go('/about'),
                        child: const Text(
                          "About Us",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Services",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 6,
          md: 6,
          child: Container(
            margin: const EdgeInsets.all(60),
            child: Column(
              children: [
                const Text("Contact Us",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                const Divider(
                  indent: 50,
                  thickness: 3,
                  endIndent: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "9878765654",
                          style: TextStyle(color: Colors.blue),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "9876765454",
                          style: TextStyle(color: Colors.blue),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "programer@gmail.com",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 6,
          md: 6,
          child: Container(
            margin: const EdgeInsets.only(top: 70, left: 30),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 140,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Email',
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey),
                            onPressed: () {},
                            child: const Text(
                              "Subscribe",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Social Media",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const IconButton(
                          onPressed: _launchFacebook,
                          color: Colors.blue,
                          icon: Icon(FontAwesomeIcons.facebook)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const IconButton(
                          onPressed: _launchTwitter,
                          color: Colors.blue,
                          icon: Icon(FontAwesomeIcons.twitter)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const IconButton(
                          onPressed: _launchYouTube,
                          color: Colors.red,
                          icon: Icon(FontAwesomeIcons.youtube)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: _launchLinkedin,
                          color: Colors.blue[700],
                          icon: const Icon(FontAwesomeIcons.linkedin)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 40, left: 20),
        width: double.infinity,
        color: Colors.black87,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "CodroidHub Pvt. Ltd.",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 300,
            child: Text(
              "#103 ACE,Devasthali,Mithapur (Ambala Cantt) Haryana,India.",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Phone: ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "9878765654",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Phone: ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "9876765454",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Email: ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "programer@gmail.com",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Quick Links",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () => context.go('/'),
                  child:
                      const Text("Home", style: TextStyle(color: Colors.blue))),
              TextButton(
                  onPressed: () => context.go('/contact'),
                  child: const Text("Contact Us",
                      style: TextStyle(color: Colors.blue))),
              TextButton(
                  onPressed: () => context.go('/about'),
                  child: const Text("About Us",
                      style: TextStyle(color: Colors.blue))),
              TextButton(
                  onPressed: () {},
                  child: const Text("Our services",
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Our Social Community",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const IconButton(
                    onPressed: _launchFacebook,
                    color: Colors.blue,
                    icon: Icon(FontAwesomeIcons.facebook)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const IconButton(
                    onPressed: _launchTwitter,
                    color: Colors.blue,
                    icon: Icon(FontAwesomeIcons.twitter)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const IconButton(
                    onPressed: _launchYouTube,
                    color: Colors.red,
                    icon: Icon(FontAwesomeIcons.youtube)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: _launchLinkedin,
                    color: Colors.blue[700],
                    icon: const Icon(FontAwesomeIcons.linkedin)),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 300,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 140,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Email',
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey),
                            onPressed: () {},
                            child: const Text(
                              "Subscribe",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 5),
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Text(
                    "Copyright with @codroidhub 2015-2023 | legal | Codroid Hub",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
