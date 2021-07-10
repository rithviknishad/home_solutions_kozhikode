import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/features.dart';

class SteelxProductSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlue.shade100,
            Colors.grey.shade300,
          ],
        ),
      ),
      padding: _getPadding(size),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The Heading
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 500),
                offset: Duration(milliseconds: 100),
              ),
              child: Text(
                "We distribute Premium Quality Stainless Steel Water Tanks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          // Tank's Banner
          Padding(
            padding: const EdgeInsets.all(15),
            child: FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 500),
                offset: Duration(milliseconds: 400),
              ),
              child: demoTank(size),
            ),
          ),

          // All features
          Padding(
            padding: const EdgeInsets.all(15),
            child: SteelxProductFeatures(),
          ),
        ],
      ),
    );
  }

  Widget demoTank(Size size) => Image(
        image: AssetImage('assets/steelx_tank.png'),
        height: size.width > 1000 ? 500 : 400,
      );

  EdgeInsets _getPadding(Size size) => EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0),
      ).copyWith(top: 30, bottom: 60);
}
