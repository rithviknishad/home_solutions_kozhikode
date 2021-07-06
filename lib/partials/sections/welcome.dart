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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/banner.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black12,
            BlendMode.darken,
          ),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 5),
                // Logo
                FadeInDown(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 250,
                    isAntiAlias: true,
                  ),
                ),

                Spacer(flex: 1),

                // Catch Phrase
                Text(
                  HomeSolutions.catchPrase,
                  style: theme.textTheme.caption?.apply(
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 8),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
