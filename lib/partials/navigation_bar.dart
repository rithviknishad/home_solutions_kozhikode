import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';

class NavBar extends StatelessWidget {
  const NavBar._();

  factory NavBar() => instance;

  static const instance = const NavBar._();

  static const _width = 1200;

  static final decoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      colors: [
        Colors.lightBlue[900]!,
        Colors.lightBlue[300]!,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      decoration: decoration,
      // color: theme.appBarTheme.backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (size.width > _width)
            SizedBox(width: (size.width - _width) / 2)
          else
            SizedBox(width: 20),

          // Home Solutions LOGO
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 40, 16),
            child: Material(
              elevation: 4,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/logo_navbar.png',
                height: 128,
                isAntiAlias: true,
              ),
            ),
          ),

          // Home Solutions Title
          if (size.width > 1000)
            Text(
              "Home Solutions",
              style: theme.textTheme.headline4?.apply(
                color: Colors.white,
                shadows: [Shadow(color: Colors.black26, blurRadius: 12)],
              ),
            ),

          Spacer(flex: 9),
          // Navigation Buttons
          if (size.width < 745)
            MyDrawer()
          else
            for (final page in HomeSolutions.pages) _NavbarPageButton(page),
          if (size.width > _width) SizedBox(width: (size.width - _width) / 2),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      color: Colors.white,
      onPressed: Scaffold.of(context).openEndDrawer,
    );
  }
}

class _NavbarPageButton extends StatelessWidget {
  final MyPage page;

  const _NavbarPageButton(this.page);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCurrent = context.routeData.name.replaceAll('_', ' ') == page.name;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(theme.scaffoldBackgroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            page.name,
            style: TextStyle(
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        onPressed: () => page.open(using: context.router),
      ),
    );
  }
}
