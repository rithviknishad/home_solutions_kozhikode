import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
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
            Colors.lightBlue.shade200,
            Colors.grey.shade100,
          ],
        ),
      ),
      padding: _getPadding(size),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The Heading
          FadeInLeft(
            preferences: slowAnimation,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
              child: FadeInUp(
                preferences: normalAnimation,
                child: Text(
                  "Premium Quality Stainless Steel Water Tanks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Tank's Banner
          demoTank(size),
          SizedBox(height: 30.0),

          // All features
          SteelxProductFeatures(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget demoTank(Size size) => Image(
        image: AssetImage('assets/steelx_tank.png'),
        isAntiAlias: true,
        filterQuality: FilterQuality.high,
        height: size.width > 1000 ? 600 : 400,
      );

  EdgeInsets _getPadding(Size size) => EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60);
}
