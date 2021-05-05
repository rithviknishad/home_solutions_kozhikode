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
          Spacer(flex: 3),

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
          if (size.width > 600)
            Text(
              "Home Solutions",
              style: theme.textTheme.headline5?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black26, blurRadius: 12)]),
            ),

          Spacer(flex: 9),
          // Navigation Buttons
          for (final b in navigationPageButtons) ...[b, const Spacer(flex: 1)],
          Spacer(flex: 3),
        ],
      ),
    );
  }

  static final navigationPageButtons = [
    _PageButton("Home", () => Home()),
    _PageButton("Products", () => Products()),
    _PageButton("Services", () => Services()),
    _PageButton("About", () => About()),
    _PageButton("Contact", () => Contact()),
  ];

  Image get logo =>
      Image.asset('assets/logo_borderless.png', height: 86, isAntiAlias: true);
}

class _PageButton extends StatelessWidget {
  final String name;
  final PageRouteInfo Function() route;

  const _PageButton(this.name, this.route);

  @override
  Widget build(BuildContext context) {
    final isCurrent = context.routeData.name.replaceAll('_', ' ') == name;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        // style: ButtonStyle(overlayColor: MaterialStateProperty.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        onPressed: () => pushPage(using: context.router),
      ),
    );
  }

  void pushPage({required StackRouter using}) {
    final route = this.route();

    if (route.routeName != using.current.name) {
      using.push(route);
      print("pushed $route");
    }
  }
}
