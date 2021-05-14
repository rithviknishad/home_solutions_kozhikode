import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';
import 'package:home_solutions_kozhikode/partials/sections/contact.dart';
import 'package:home_solutions_kozhikode/partials/sections/footer.dart';
import 'package:home_solutions_kozhikode/partials/sections/welcome.dart';
import 'package:home_solutions_kozhikode/partials/wrapper.dart';

class LandingPage extends StatelessWidget {
  final controller = ScrollController(initialScrollOffset: 700);

  @override
  Widget build(context) {
    return PageWrapper(
      appBar: null,
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverPersistentHeader(delegate: _HeaderDelegate(), pinned: true),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                WelcomeSection(),
                ContactSection(),
                FooterSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  static const _drawer = MyDrawer();

  @override
  Widget build(context, shrinkOffset, _) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final animation = scrollAnimationValue(shrinkOffset);

    return Material(
      elevation: 6 * (1 - animation),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[900]!.withOpacity(1 - animation),
            Colors.lightBlue[700]!.withOpacity(1 - animation),
          ],
        )),
        height: visibleMainHeight,
        width: size.width,
        padding:
            EdgeInsets.symmetric(horizontal: max((size.width - 1140) / 2, 0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              // Logo
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 1 - animation,
                    child: logo,
                  )),

              // Nav Bar Buttons
              if (size.width > 1000)
                Positioned(
                  right: 0,
                  child: _InlineNavBar(animation: animation),
                )
              else
                Positioned(right: 0, child: _drawer),
            ],
          ),
        ),
      ),
    );
  }

  Widget get logo => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
          // elevation: 4,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/logo_borderless.png',
            // height: 128,
            isAntiAlias: true,
          ),
        ),
      );

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 60.0;

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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: section.value,
              child: Text(
                section.key,
                style: TextStyle(
                  color: Color.lerp(Colors.white, Colors.blue, animation),
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
