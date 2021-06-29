import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';

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
