import 'package:codroid_hub/widgets/team_carousel.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade800,
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Meet Our Team",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              height: 20,
            ),
            CarouselImages()
          ],
        ));
  }
}
