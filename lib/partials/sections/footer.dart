import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class FooterSection extends MySection {
  TextStyle get addressStyle => TextStyle(
        color: Colors.grey.shade300,
        fontSize: 16,
        letterSpacing: 1,
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey.shade900,
      padding: sectionPadding(size),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOME SOLUTIONS',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 15),
          Text("P.O. Edakkad, Kunduparamba", style: addressStyle),
          Text("Kozhikode, 673005", style: addressStyle),
        ],
      ),
    );
  }

  EdgeInsets sectionPadding(Size size) => EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
        vertical: 60,
      );
}
