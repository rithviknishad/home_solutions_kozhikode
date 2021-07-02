import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    required this.text,
    required this.gradient,
  });

  final Text text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    assert(text.style?.color == Colors.white,
        "Set textStyle's color as white to work.");

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}
