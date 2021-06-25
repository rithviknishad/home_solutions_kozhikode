import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class SteelxProductSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Heading(),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage('assets/steelx_banner.png'),
                  height: 600,
                ),
              ),

              // Features
              _FeatureTile(
                description: "No Bacteria",
                asset:
                    'assets/steelx_features/no_bacteria_fungae_and_algae.png',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String description;
  final String asset;

  const _FeatureTile({
    required this.description,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image(image: AssetImage(asset), height: 100),
          SizedBox(width: 10),
          Text(
            description,
            style: TextStyle(fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
      child: FadeInUp(
        preferences: normalAnimation,
        child: Text(
          "Premium Quality Stainless Steel Water Tanks",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
