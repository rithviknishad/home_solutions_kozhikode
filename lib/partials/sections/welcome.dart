import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';

class WelcomeSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[300]!,
            Colors.grey[200]!,
          ],
        ),
      ),
      height: size.height * 0.9,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/banner.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black12,
              BlendMode.darken,
            ),
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  // elevation: 4,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/logo_borderless.png',
                    height: size.height * 0.4,
                    isAntiAlias: true,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Text(
                  HomeSolutions.catchPrase,
                  style: theme.textTheme.caption?.apply(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
