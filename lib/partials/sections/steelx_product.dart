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
      padding: EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Heading(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image(
              image: AssetImage('assets/steelx_banner.png'),
              isAntiAlias: true,
              filterQuality: FilterQuality.high,
              height: 600,
            ),
          ),
          SizedBox(height: 30.0),
          _SteelxProductFeatures(),
        ],
      ),
    );
  }
}

class _SteelxProductFeatures extends StatelessWidget {
  const _SteelxProductFeatures({Key? key}) : super(key: key);

  static const _features = {
    "No Bacteria, Fungus & Algae": "no_bacteria_fungae_and_algae.png",
    "Safe Healthy & Hygienic": "safe_healthy_and_hygienic.png",
    "SS 304/316 BA Food Grade Steel & Medical Grade": "food_grade.png",
    "Mirror Finish Steel": "mirror_finish.png",
    "Bio-degradable": "bio_degradable.png",
    "No Harmful Toxins": "no_harmful_toxins.png",
    "Easy Cleaning": "easy_cleaning.png",
    "Maintains Temperature": "maintains_temperature.png",
    "Easy Installation": "easy_installation.png",
    "High Resale Valued Material": "high_resale_valued_material.png",
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 30,
      runSpacing: 30,
      children: [
        for (final f in _features.entries)
          _FeatureTile(
            description: f.key,
            asset: 'assets/steelx_features/${f.value}',
          ),
      ],
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
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 200.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage(asset),
            height: 60,
          ),
          SizedBox(height: 12.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

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
