import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/main.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';

class WelcomeSection extends MySection {
  static double sectionHeight = 0;

  WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    sectionHeight = size.height * (size.width < 1000 ? 0.7 : 0.9);
    return Container(
      height: sectionHeight,
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
                    HomeSolutions.catchPhrase,
                    style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontSize: 32,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 8),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(flex: 3),

                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 1000),
                    offset: const Duration(milliseconds: 2000),
                  ),
                  child: Bounce(
                    preferences: AnimationPreferences(
                      duration: const Duration(milliseconds: 1000),
                      offset: const Duration(milliseconds: 3000),
                    ),
                    child: IconButton(
                      onPressed: () => LandingPage.scrollController.animateTo(
                        sectionHeight + 50,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      ),
                      icon: Icon(
                        Icons.expand_more,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
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
