import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';

class SteelxProductFeatures extends StatelessWidget {
  SteelxProductFeatures({Key? key}) : super(key: key);

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

  final features = _features.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: MediaQuery.of(context).size.width > 1000 ? 30 : 10,
      runSpacing: 30,
      children: [
        for (int index = 0; index < features.length; ++index)
          _FeatureTile(
            index,
            description: features[index].key,
            asset: 'assets/steelx_features/${features[index].value}',
          ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String description;
  final String asset;
  final int index;

  const _FeatureTile(
    this.index, {
    required this.description,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final theme = Theme.of(context);

    return FadeIn(
      preferences: AnimationPreferences(
        duration: const Duration(milliseconds: 500),
        offset: Duration(milliseconds: 100 + index * 100),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: size.width > 1000 ? 200.0 : 160.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(asset),
              height: 50,
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
      ),
    );
  }
}
