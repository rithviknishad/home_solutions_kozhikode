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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            HomeSolutions.catchPrase,
            style: theme.textTheme.caption,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.1),
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
        ],
      ),
    );
  }
}
