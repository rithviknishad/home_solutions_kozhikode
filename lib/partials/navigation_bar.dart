import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar._();

  factory MyNavigationBar() => instance;

  static const instance = const MyNavigationBar._();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      color: theme.appBarTheme.backgroundColor,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Spacer(flex: 3),

          // Home Solutions LOGO
          Image.asset('assets/logo.png', height: 90, isAntiAlias: true),

          // Home Solutions Title
          if (size.width > 600) ...[
            SizedBox(width: 40),
            Text(
              "Home Solutions",
              style: theme.textTheme.headline6?.copyWith(
                  color: theme.primaryColor, fontWeight: FontWeight.bold),
            ),
          ],

          Spacer(flex: 9),
          // Navigation Buttons
          for (final b in navigationPageButtons) ...[b, const Spacer(flex: 1)],
          Spacer(flex: 3),
        ],
      ),
    );
  }

  static final navigationPageButtons = [
    _PageButton("Home", () => LandingRoute()),
    _PageButton("Products", () => ProductsRoute()),
    _PageButton("About Us", () => AboutUsRoute()),
  ];
}

class _PageButton extends StatelessWidget {
  final String name;
  final PageRouteInfo Function() route;

  const _PageButton(this.name, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name),
        ),
        onPressed: () => pushPage(using: context.router),
      ),
    );
  }

  void pushPage({required StackRouter using}) {
    final route = this.route();

    if (route.routeName != using.current.name) {
      using.push(route);
    }
  }
}
