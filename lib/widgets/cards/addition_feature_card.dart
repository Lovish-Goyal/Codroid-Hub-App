import 'package:flutter/material.dart';

import '../animated_text.dart';

class AdditionalFeaturesCard extends StatelessWidget {
  const AdditionalFeaturesCard({
    super.key,
    required this.headingText,
    required this.subHeadingText,
    required this.icon,
    required this.color,
  });

  final String headingText;
  final String subHeadingText;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      elevation: 5,
      shadowColor: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 80,
            ),
            AnimatedText(text: headingText),
            AnimatedText(
              text: subHeadingText,
            ),
          ],
        ),
      ),
    );
  }
}
