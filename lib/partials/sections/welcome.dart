import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class WelcomeSection extends MySection {
  WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * (size.width < 1000 ? 0.7 : 0.9),
      width: size.width,
      decoration: _decoration,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 5),
                // Logo
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 1000),
                    offset: const Duration(milliseconds: 100),
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                    width: min(250, size.width * 0.3),
                    isAntiAlias: true,
                  ),
                ),

                const Spacer(flex: 1),

                // Catch Phrase
                SlideInUp(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 1000),
                    offset: const Duration(milliseconds: 400),
                  ),
                  child: Text(
                    HomeSolutions.catchPrase,
                    style: theme.textTheme.caption?.apply(
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 8),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const _decoration = BoxDecoration(
    image: DecorationImage(
      image: ExactAssetImage('assets/banner.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
    ),
  );
}
