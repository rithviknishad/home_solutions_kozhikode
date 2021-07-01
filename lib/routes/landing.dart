import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/sections/about.dart';
import 'package:home_solutions_kozhikode/partials/sections/contact.dart';
import 'package:home_solutions_kozhikode/partials/sections/footer.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/size_selector.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/steelx.dart';
import 'package:home_solutions_kozhikode/partials/sections/welcome.dart';

class LandingPage extends StatelessWidget {
  final controller = ScrollController(initialScrollOffset: 700);

  @override
  Widget build(context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverPersistentHeader(
            delegate: _NavigationBarDelegate(),
            floating: true,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                WelcomeSection(),
                SteelxProductSection(),
                SteelxTankSizesSection(),
                AboutUsSection(),
                ContactSection(),
                FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, shrinkOffset, _) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final animation = scrollAnimationValue(shrinkOffset);
    final borderRadius = BorderRadius.vertical(
      bottom: Radius.lerp(
            Radius.elliptical(100, 10),
            Radius.circular(30),
            animation,
          ) ??
          Radius.zero,
    );
    return Material(
      elevation: 6 * animation,
      // shadowColor: theme.shadowColor.withOpacity(animation / 2),

      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(animation),
            borderRadius: borderRadius,
          ),
          height: visibleMainHeight,
          width: size.width,
          padding: EdgeInsets.symmetric(
            horizontal: max((size.width - 1140) / 2, 0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                // Logo
                Positioned(left: 0, top: 0, bottom: 0, child: logo),

                // Nav Bar Buttons
                if (size.width > 1000)
                  Positioned(
                    right: 0,
                    child: _InlineNavBar(animation: animation),
                  )
                else
                  Positioned(
                    right: lerpDouble(0, 10, animation),
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      color: theme.primaryColor.withOpacity(animation),
                      onPressed: Scaffold.of(context).openEndDrawer,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get logo => Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/logo_transparent.png',
          isAntiAlias: true,
        ),
      );

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(_) => true;

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;

    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }
}

class _InlineNavBar extends StatelessWidget {
  final double animation;

  const _InlineNavBar({this.animation = 1.0});

  static final _sections = {
    "Products": () {},
    "Services": () {},
    "About": () {},
    "Contact": () {},
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final section in _sections.entries)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: section.value,
              child: Text(
                section.key,
                style: TextStyle(
                  color:
                      Color.lerp(Colors.transparent, Colors.white, animation),
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          )
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: theme.accentColor,
      height: 510,
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: 65,
        horizontal: (size.width - 1170) / 2,
      ),
      child: Container(),
    );
  }
}
