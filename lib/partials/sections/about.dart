import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class AboutUsSection extends MySection {
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
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInRight(
            preferences: normalAnimation,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
              child: Text(
                "We are ...",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
          FadeInRight(
            preferences: slowAnimation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _description,
                style: TextStyle(
                  color: theme.primaryColorDark,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }

  static const _description =
      "... the official distributors of SteelX stainless water tank products in Kozhikode and Wayanad.\n\nSteelx is a single source manufacturer offering totally integrated water treatment solutions. Vertical integration through recent acquisitions combined expertise and knowledge in the water treatment industry places us clearly above industry competition. Core strength lies in designing customized plants and assemblies with the use of cutting edge technology.";
}
