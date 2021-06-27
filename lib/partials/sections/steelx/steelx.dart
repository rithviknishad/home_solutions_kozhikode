import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/features.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/size_selector.dart';

class SteelxProductSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      padding: _getPadding(size),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
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
                ),
              ),
            ),
          ),

          // Tank's Banner
          demoTank,
          SizedBox(height: 30.0),

          // All features
          SteelxProductFeatures(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget get demoTank => Padding(
        padding: const EdgeInsets.all(8),
        child: Image(
          image: AssetImage('assets/steelx_banner.png'),
          isAntiAlias: true,
          filterQuality: FilterQuality.high,
          height: 600,
        ),
      );

  EdgeInsets _getPadding(Size size) => EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60);
}