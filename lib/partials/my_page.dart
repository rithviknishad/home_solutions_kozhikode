import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyPage {
  final String name;
  final Icon icon;
  final PageRouteInfo Function() opens;

  const MyPage({
    required this.name,
    required this.icon,
    required this.opens,
  });

  void open({required StackRouter using}) {
    final route = opens();
    if (route.routeName != using.current.name) using.push(route);
  }

  bool isCurrent(BuildContext context) =>
      context.routeData.name.replaceAll('_', ' ') == name;
}
