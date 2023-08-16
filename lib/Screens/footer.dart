import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(30),
            color: Colors.grey[850],
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xl: 4,
                lg: 4,
                md: 6,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Codroid Hub",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 60.0,
                        ),
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Hey, Our company is good and provides a lot of jobs and training in all over the world hurry up guys and takle advantages of it",
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),),

                      SizedBox(
                        height: 40,
                      ),
                      Text(
                          "Copyright with @codroidhub 2015-2023 | legal | Codroid Hub",
                          style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 4,
                lg: 4,
                md: 6,
                child: Container(
                  margin: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text("Quick Links",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      Divider(
                        indent: 80,
                        thickness: 3,
                        endIndent: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Home",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Contact Us",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "About us",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Policies",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
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
                  margin: EdgeInsets.only(top: 70, left: 30),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600]),
                          onPressed: () {},
                          child: Text(
                            "Subscribe",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.facebook)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.twitter)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.google)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.linkedin))
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
      padding: EdgeInsets.only(top: 30,left: 20),
      width: double.infinity,
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("CodroidHub Private Limited",
           style: TextStyle(
            color: Colors.white,
            fontSize: 25
           ),),
           SizedBox(
            height: 20,
           ),
           Container(
            width: 300,
             child: Text("#103 ACE,Devasthali,Mithapur (Ambala Cantt) Haryana,India.",
             style: TextStyle(
              color: Colors.white,
              fontSize: 15
             ),),
           ),
           SizedBox(
            height: 50,
           ),
           Text("Quick Links", style: TextStyle(
              color: Colors.white,
              fontSize: 20
             ),),
             SizedBox(
              height: 10,
             ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: (){}, child: Text("Home",style: TextStyle(color: Colors.blue))),
              TextButton(onPressed: (){}, child: Text("Contact us",style: TextStyle(color: Colors.blue))),
              TextButton(onPressed: (){}, child: Text("About us",style: TextStyle(color: Colors.blue))),
              TextButton(onPressed: (){}, child: Text("Our services",style: TextStyle(color: Colors.blue))),
            ],
           ),
           SizedBox(
            height: 30,
           ),
           Text("Join Our Social Community", style: TextStyle(
              color: Colors.white,
              fontSize: 20
             ),),
             SizedBox(
            height: 10,
           ),
             Container(
              child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.facebook)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.twitter)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.google)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.linkedin))
                        ],
                      ),
             ),
             SizedBox(
              height: 30,
             ),
             Center(
               child: Container(
                          height: 50,
                          width: 300,
                          padding: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                            ),
                          ),
                        ),
             ), SizedBox(
              height: 10,
             ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[600]),
                            onPressed: () {},
                            child: Text(
                              "Subscribe",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 5 ),
                        color: Colors.transparent,
                        width: double.infinity,
                        child:  Text(
                          "Copyright with @codroidhub 2015-2023 | legal | Codroid Hub",
                          style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),),
                      )
        ],
      ),
    );
  }
}