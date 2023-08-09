import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Codroid Hub"),
            if(MediaQuery.of(context).size.width > 700)
            Row(
              children: [
                TextButton(onPressed: () {},
             child: Text("Home")),
             SizedBox(
              height: 20,
             ),
              TextButton(onPressed: () {},
             child: Text("contact us")),
             SizedBox(
              height: 20,
             ),
              TextButton(onPressed: () {},
             child: Text("About us")),
             SizedBox(
              height: 20,
             ),
              TextButton(onPressed: () {},
             child: Text("Our Team")),
             SizedBox(
              height: 20,
             ),
             TextButton(onPressed: () {},
             child: Text("services")),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [ 
                Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/codroid.jpg"),
                fit: BoxFit.fill,)
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 180),
                  child: Column(
                    children: [
                      Text("Welcome to Codroid Hub",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Let`s start your journey with the best company codroid hub",
                      style: TextStyle(
                        color: Colors.black
                      ),),
                    ],
                  ),
                )
              ),
                Container(
                  margin: EdgeInsets.only(
                    top: 450,
                   ),
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        xl: 4,
                        child: Container(
                          margin: EdgeInsets.all(60),
                          height: 300,
                          width: 400,
                          color: Colors.amber,
                          child: Container(
                            margin: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Icon(Icons.add_box_outlined,size: 100,color: Colors.white,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Modern Courses",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                                 Text("we are offering latest tachnology based courses.",
                                 style: TextStyle(
                                  color: Colors.white,
                                ),
                                 ),
                              ],
                            ),
                          ),
                        )),
                        ResponsiveGridCol(
                        xl: 4,
                        child: Container(
                          margin: EdgeInsets.all(60),
                         height: 300,
                          width: 400,
                          color: Colors.purple,
                           child: Container(
                            margin: EdgeInsets.all(30),
                             child: Column(
                              children: [
                                Icon(Icons.monitor_heart,size: 100,color: Colors.white,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Afforadable Costs",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                                 Text("The courses are based on latest technology and available in low cost.",
                                  style: TextStyle(
                                  color: Colors.white,
                                ),),
                              ],
                                                     ),
                           ),
                        )),
                        ResponsiveGridCol(
                        xl: 4,
                        child: Container(
                          margin: EdgeInsets.all(60),
                          height: 300,
                          width: 400,
                          color: Colors.green,
                          child: Container(
                            margin: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Icon(Icons.favorite_border, size:100,color: Colors.white,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Reach Programs",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                                 Text("Programs are based on latest technology and reach to evry person easily.",
                                  style: TextStyle(
                                  color: Colors.white,
                                ),),
                              ],
                            ),
                          ),
                        ))
                    ]),
                )
              ]
            ),
          ]
        ),
      ),
      endDrawer: MediaQuery.of(context).size.width < 700 ? Drawer() : null, 
    );
  }
}