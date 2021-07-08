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
  static final sections = [
    WelcomeSection(),
    SteelxProductSection(),
    SteelxTankSizesSection(),
    AboutUsSection(),
    ContactSection(),
    FooterSection(),
  ];

  LandingPage() : super(key: Key('_landing_page'));

  static final scrollController = ScrollController();

  build(context) {
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 0,
        controller: scrollController,
        slivers: [
          // App Bar / Navigation Bar / Header
          const SliverPersistentHeader(
            delegate: _NavigationBarDelegate(),
            pinned: true,
          ),

          // Reamining page
          SliverList(delegate: SliverChildListDelegate.fixed(sections)),
        ],
      ),
    );
  }
}

class _NavigationBarDelegate extends SliverPersistentHeaderDelegate {
  const _NavigationBarDelegate();

  build(context, shrinkOffset, _) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final animation = scrollAnimationValue(shrinkOffset);

    return Material(
      elevation: 6 * animation,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.lerp(
              Radius.circular(10),
              Radius.circular(30),
              animation,
            )!,
          ),
        ),

        // visible height
        height: max(maxExtent - shrinkOffset, minExtent),
        width: size.width,

        // Apply left and right spacing if screen too wide
        padding: EdgeInsets.symmetric(
          horizontal: max((size.width - 1140) / 2, 0) + 20,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            // Home Solutions Logo, scales with height of app bar
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/logo_transparent.png',
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),

            Positioned(
              right: lerpDouble(0, 10, animation),
              child: size.width > 1000
                  ? _InlineNavBar(animation: animation)
                  : IconButton(
                      icon: Icon(Icons.menu),
                      color: theme.primaryColor.withOpacity(animation),
                      onPressed: Scaffold.of(context).openEndDrawer,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  get maxExtent => 80;

  get minExtent => 50;

  shouldRebuild(_) => true;

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
    final theme = Theme.of(context);

    return Row(
      children: [
        for (final section in _sections.entries)
          TextButton(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                section.key,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: lerpDouble(14, 16, animation),
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: section.value,
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
