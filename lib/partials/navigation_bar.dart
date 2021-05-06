import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/router.gr.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar._();

  factory MyNavigationBar() => instance;

  static const instance = const MyNavigationBar._();

  static const _width = 1100;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    print(size);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[900]!,
            Colors.lightBlue[300]!,
          ],
        ),
      ),
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
              child: logo,
            ),
          ),

          // Home Solutions Title
          if (size.width > 1000)
            Text(
              "Home Solutions",
              style: theme.textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black26, blurRadius: 12)]),
            ),

          Spacer(flex: 9),
          // Navigation Buttons
          if (size.width < 745)
            Padding(
              padding: const EdgeInsets.all(32),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                iconSize: 32,
                onPressed: Scaffold.of(context).openEndDrawer,
              ),
            )
          else
            for (final page in HomeSolutions.pages) _NavbarPageButton(page),
          if (size.width > _width) SizedBox(width: (size.width - _width) / 2),
        ],
      ),
    );
  }

  Image get logo =>
      Image.asset('assets/logo_borderless.png', height: 128, isAntiAlias: true);
}

class _NavbarPageButton extends StatelessWidget {
  final MyPage page;

  const _NavbarPageButton(this.page);

  @override
  Widget build(BuildContext context) {
    final isCurrent = context.routeData.name.replaceAll('_', ' ') == page.name;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        // style: ButtonStyle(overlayColor: MaterialStateProperty.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            page.name,
            style: TextStyle(
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        onPressed: () => _open(using: context.router),
      ),
    );
  }

  void _open({required StackRouter using}) {
    final route = this.page.opens();
    if (route.routeName != using.current.name) using.push(route);
  }
}
