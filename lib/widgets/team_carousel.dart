import 'package:carousel_slider/carousel_slider.dart';
import 'package:codroid_hub/modules/members/provider/members_provider.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:codroid_hub/utils/text_length_limiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarouselImages extends ConsumerWidget {
  const CarouselImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersList = ref.watch(membersListProvider);
    return CarouselSlider(
      items: [
       Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 320,
                child: Image.asset("images/bhawana.jpg",fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bhawana Saini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Program Manager",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16),
              ),
              
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 320,
                child: Image.asset("images/Devashish.jpg",fit: BoxFit.fill,),
              ),
               SizedBox(
                height: 10,
              ),
              Text(
                "Devashish Kumar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Founder",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16),
              ),
             
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 320,
                child: Image.asset("images/kanishak.jpg",fit: BoxFit.fill,),
              ),
               SizedBox(
                height: 10,
              ),
              Text(
                "Kumar Kanishk",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Developer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16),
              ),
             
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 320,
                child: Image.asset("images/shruti.jpg",fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Shruti",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Developer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16),
              ),
              
            ],
          ),
        ),
      ],
      options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: MediaQuery.of(context).size.width < 800 ? .8 : .3),
    );
    // membersList.when(
    //     data: ((list) => CarouselSlider.builder(
    //           options: CarouselOptions(
    //             height: MediaQuery.of(context).size.width > 800 ? 600 : 580,
    //             viewportFraction:
    //                 MediaQuery.of(context).size.width > 800 ? 0.5 : .8,
    //             initialPage: 0,
    //             enableInfiniteScroll: true,
    //             reverse: false,
    //             autoPlay: true,
    //             autoPlayInterval: const Duration(seconds: 3),
    //             autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //             autoPlayCurve: Curves.fastOutSlowIn,
    //             enlargeCenterPage: true,
    //             enlargeFactor: 0.3,
    //             scrollDirection: Axis.horizontal,
    //           ),
    //           itemCount: list.length,
    //           itemBuilder:
    //               (BuildContext context, int itemIndex, int pageViewIndex) =>
    //                   Container(
    //             width: double.infinity,
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    //             color: Colors.grey[300],
    //             child: Column(
    //               children: [
    //                 Container(
    //                   child: Image.network(list[itemIndex].imgUrl ?? ""),
    //                 ),
    //                 // CircleAvatar(
    //                 //   radius: 150,
    //                 //   backgroundImage: NetworkImage(list[itemIndex].imgUrl ?? "")
    //                 // ),
    //                 // const SizedBox(
    //                 //   height: 10,
    //                 // ),
    //                 Text(
    //                   list[itemIndex].name,
    //                   style: const TextStyle(fontWeight: FontWeight.bold),
    //                   textScaleFactor: 1.8,
    //                 ),
    //                 const SizedBox(
    //                   height: 20,
    //                 ),
    //                 Text(
    //                   limitTextLength(list[itemIndex].description ?? "", 300),
    //                   //   "${list[itemIndex].description}",
    //                   textAlign: TextAlign.center,
    //                   style: const TextStyle(fontSize: 15),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )),
    //     error: ((err, st) => Center(
    //           child: Text(err.toString()),
    //         )),
    //     loading: () => const Loder());
  }
}
