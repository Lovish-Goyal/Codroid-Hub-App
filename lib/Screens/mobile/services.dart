import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/appbar.dart';
import '../../widgets/end_drawer.dart';

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
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2018/04/26/16/31/marine-3352341_640.jpg"),fit: BoxFit.cover),
            
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
              child: Text("We Offer a Wide Variety of It Services",style: TextStyle(fontSize: 25,color: Colors.black87, fontWeight: FontWeight.bold),)),
          ),


          Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Web development",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "The process of designing, building, and maintaining websites using various technologies, tools, programming languages and no - code approach"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),

              Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Cyber Security",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Protection of computer systems, networks, and data from unauthorized access, attacks, and digital threats"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),

              Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Blockchain",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Transparent, secure, decentralized ledger for recording and verifying transactions immutably"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),
              Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("AI/ML Services",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "AI/ML refers to the use of algorithms to enable machines to learn from data and make intelligent decisions"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),

              Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Product Design",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Product design is the iterative process of conceptualizing, prototyping, and refining products to deliver exceptional user experiences and values"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),

              Container(
           margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
            ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 280,
                    child: Column(
                      children: [
                        Icon(Icons.developer_mode,size: 70,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Dedicated Team",style: TextStyle(fontSize: 25),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "A dedicated team is a focused group of professionals committed to achieving project goals through specialized expertise and coordinated efforts"),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )),
        ],
      ),
    ),
     endDrawer: const EndDrawer(),
    );
  }
}
