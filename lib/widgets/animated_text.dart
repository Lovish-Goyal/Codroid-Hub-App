import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  AnimatedText({
    super.key,
    required this.text,
  });

  final String text;
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,

      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
          speed: const Duration(seconds: 1),
          textAlign: TextAlign.center,
        ),
      ],
      // isRepeatingAnimation: true,
    );
  }
}
