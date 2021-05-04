import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final current = router.current.name;

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Logo

          // Title

          Spacer(),

          _PageButton(
            name: "Home",
            onPressed: () => router.push(LandingRoute()),
            isCurrent: current == LandingRoute.name,
          ),

          _PageButton(
            name: "Products",
            onPressed: () => router.push(ProductsRoute()),
            isCurrent: current == ProductsRoute.name,
          ),

          _PageButton(
            name: "About Us",
            onPressed: () => router.push(AboutUsRoute()),
            isCurrent: current == AboutUsRoute.name,
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final String name;
  final Future Function() onPressed;
  final bool isCurrent;

  const _PageButton({
    required this.name,
    required this.onPressed,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: Text(name),
        onPressed: onPressed,
      ),
    );
  }
}
