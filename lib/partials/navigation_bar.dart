import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Logo

          // Title

          Spacer(),

          _PageButton(name: "Home", route: () => LandingRoute()),
          _PageButton(name: "Products", route: () => ProductsRoute()),
          _PageButton(name: "About Us", route: () => AboutUsRoute()),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final String name;
  final PageRouteInfo Function() route;

  const _PageButton({
    required this.name,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: Text(name),
        onPressed: () {
          final route = this.route();

          if (route.routeName != router.current.name) {
            router.push(route);
          }
        },
      ),
    );
  }
}
