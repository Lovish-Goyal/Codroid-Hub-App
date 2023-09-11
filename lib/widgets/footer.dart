
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
      color: Colors.grey[850],
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
          xl: 4,
          lg: 4,
          md: 6,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Codroid Hub",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                ),
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
          xl: 4,
          lg: 4,
          md: 6,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              children: [
                const Text("Quick Links",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                const Divider(
                  indent: 80,
                  thickness: 3,
                  endIndent: 80,
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
                          "About us",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Policies",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Support",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 4,
          lg: 4,
          md: 6,
          child: Container(
            margin: const EdgeInsets.only(top: 70, left: 30),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600]),
                    onPressed: () {},
                    child: const Text(
                      "Subscribe",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
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
      padding: const EdgeInsets.only(top: 30, left: 20),
      width: double.infinity,
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CodroidHub Private Limited",
            style: TextStyle(color: Colors.white, fontSize: 25),
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
            height: 50,
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
                  child: const Text("Contact us",
                      style: TextStyle(color: Colors.blue))),
              TextButton(
                  onPressed: () => context.go('/about'),
                  child: const Text("About us",
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
            "Join Our Social Community",
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
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 50,
              width: 300,
              padding: const EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Email',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[600]),
                onPressed: () {},
                child: const Text(
                  "Subscribe",
                  style: TextStyle(color: Colors.white),
                )),
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
    );
  }
}
