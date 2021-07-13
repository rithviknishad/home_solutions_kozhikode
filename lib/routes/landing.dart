import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:home_solutions_kozhikode/main.dart';
import 'package:home_solutions_kozhikode/partials/sections/about.dart';
import 'package:home_solutions_kozhikode/partials/sections/contact.dart';
import 'package:home_solutions_kozhikode/partials/sections/footer.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/size_selector.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/steelx.dart';
import 'package:home_solutions_kozhikode/partials/sections/welcome.dart';
import 'package:url_launcher/link.dart';

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
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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

          SliverList(
            delegate: SliverChildListDelegate.fixed(sections),
          ),
        ],
      ),
      floatingActionButton: size.width < 1000
          ? BounceIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 500),
                offset: Duration(seconds: 4),
              ),
              child: CallNowButton(),
            )
          : null,
      endDrawer: Theme(
        data: theme.copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1C3559).withOpacity(0.9),
                  Color(0xFF051937).withOpacity(0.9),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < _InlineNavBar._sections.length; ++i)
                  ListTile(
                    tileColor:
                        i.isEven ? Colors.grey.shade500 : Colors.grey.shade300,
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      _InlineNavBar._sections.entries.elementAt(i).key,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      _InlineNavBar._sections.entries
                          .elementAt(i)
                          .value(context);
                      Navigator.of(context).pop();
                    },
                  ),
              ],
            ),
          ),
        ),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/logo_transparent.png',
                    ),
                  ),
                  if (animation == 0)
                    FadeInDown(
                      preferences: const AnimationPreferences(
                        duration: Duration(milliseconds: 500),
                      ),
                      child: Text(
                        HomeSolutions.catchPhrase,
                        style: TextStyle(
                          fontFamily: 'Lemonada',
                          color: theme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),

            Positioned(
              right: lerpDouble(0, 10, animation),
              child: size.width > 1000
                  ? _InlineNavBar(animation: animation)
                  : IconButton(
                      icon: Icon(Icons.menu),
                      color: theme.primaryColor,
                      onPressed: Scaffold.of(context).openEndDrawer,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  get maxExtent => 80;

  get minExtent => 60;

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
    "Products": jumpToProductSection,
    "About": jumpToAboutSection,
    "Contact": jumpToContactSection,
  };

  static void jumpToProductSection(BuildContext context) {
    LandingPage.scrollController.animateTo(
      WelcomeSection.sectionHeight + 50,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  static void jumpToAboutSection(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1000) {
      LandingPage.scrollController.animateTo(
        2414,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    } else {
      LandingPage.scrollController.animateTo(
        WelcomeSection.sectionHeight + 2750,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  static void jumpToContactSection(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1000) {
      LandingPage.scrollController.animateTo(
        3053,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    } else {
      LandingPage.scrollController.animateTo(
        WelcomeSection.sectionHeight + 3420,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (final section in _sections.entries)
          TextButton(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                section.key,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: lerpDouble(16, 18, animation),
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () => section.value(context),
          ),
        SizedBox(width: 26),
        CallNowButton(),
      ],
    );
  }
}

class CallNowButton extends StatelessWidget {
  const CallNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      key: Key('call_us_button'),
      preferences: AnimationPreferences(
        duration: const Duration(milliseconds: 500),
        offset: const Duration(milliseconds: 500),
      ),
      child: Link(
        uri: Uri(scheme: 'tel', path: '+91 9048-336658'),
        builder: (context, followLink) => ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 10,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            onPrimary: Colors.white,
          ),
          onPressed: followLink,
          icon: Icon(Icons.call),
          label: Text(
            'Call us now',
            style: TextStyle(letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
