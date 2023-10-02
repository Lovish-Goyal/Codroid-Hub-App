import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard(
      {super.key,
      required this.headingText,
      required this.color,
      required this.detailText,
      required this.icon});

  final String headingText;
  final String detailText;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      // height: 350,
      // width: 400,
      color: color,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              icon,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              headingText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            Text(
              detailText,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
