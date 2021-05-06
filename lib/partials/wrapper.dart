import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(138),
        child: MyNavigationBar(),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            for (final page in HomeSolutions.pages) _DrawerPageButton(page),
          ],
        ),
      ),
    );
  }
}

class _DrawerPageButton extends StatelessWidget {
  final MyPage page;

  const _DrawerPageButton(this.page);

  @override
  Widget build(BuildContext context) {
    final isCurrent = context.routeData.name.replaceAll('_', ' ') == page.name;

    return ListTile(
      title: Text(
        page.name,
        style: TextStyle(
          fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
        ),
      ),
      onTap: () => page.open(using: context.router),
    );
  }
}
