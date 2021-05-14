import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class FooterSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 4,
      color: Colors.grey[900],
      child: Container(
        padding: sectionPadding(size),
        width: size.width,
        child: Column(
          children: [
            Text(""),
          ],
        ),
      ),
    );
  }

  EdgeInsets sectionPadding(Size size) => EdgeInsets.symmetric(
      horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10);
}
