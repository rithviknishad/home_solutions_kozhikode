import 'package:flutter/material.dart';

class SteelxProductFeatures extends StatelessWidget {
  const SteelxProductFeatures({Key? key}) : super(key: key);

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
