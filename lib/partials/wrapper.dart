import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  final PreferredSizeWidget? appBar;

  const PageWrapper({
    required this.child,
    this.appBar = _kDefaultNavigationBar,
  });

  static const _kDefaultNavigationBar = PreferredSize(
    preferredSize: Size.fromHeight(138),
    child: NavBar.instance,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: child,
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView(
            children: [
              for (final page in HomeSolutions.pages) _DrawerPageButton(page),
            ],
          ),
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
    final theme = Theme.of(context);
    final isCurrent = page.isCurrent(context);

    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      tileColor: isCurrent ? theme.hoverColor : null,
      leading: Icon(
        page.icon.icon,
        size: 28,
        color: theme.primaryColor.withOpacity(isCurrent ? 1.0 : 0.8),
      ),
      title: Text(
        page.name,
        style: theme.textTheme.button?.apply(
          color: theme.primaryColor.withOpacity(isCurrent ? 1.0 : 0.8),
          fontSizeDelta: 2,
          fontWeightDelta: isCurrent ? 300 : 0,
        ),
      ),
      onTap: () => page.open(using: context.router),
    );
  }
}
