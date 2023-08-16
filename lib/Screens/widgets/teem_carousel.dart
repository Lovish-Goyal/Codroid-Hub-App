import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 600,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        color: Colors.grey[300],
        child: const Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/codroid.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Member Name",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.8,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Member description is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
