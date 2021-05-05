import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Spacer(flex: 2),

          // Home Solutions LOGO
          Text("LOGO"),

          // Home Solutions Title
          if (size.width > 600) ...[
            SizedBox(width: 32),
            Text("Home Solutions", style: theme.textTheme.headline5),
          ],

          Spacer(flex: 6),

          // Navigation Buttons
          ...navigationPageButtons,

          Spacer(flex: 2),
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
