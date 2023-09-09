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
    return membersList.when(
        data: ((list) => CarouselSlider.builder(
              options: CarouselOptions(
                height: 615,
                viewportFraction: 0.9,
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
              itemCount: list.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                color: Colors.grey[300],
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          NetworkImage(list[itemIndex].imgUrl ?? ""),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      list[itemIndex].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.8,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      limitTextLength(list[itemIndex].description ?? "", 300),

                      //   "${list[itemIndex].description}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            )),
        error: ((err, st) => Center(
              child: Text(err.toString()),
            )),
        loading: () => const Loder());
  }
}
