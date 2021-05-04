import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';

void main() => runApp(HomeSolutions());

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LandingPage, initial: true),
  ],
)
class $AppRouter {}

class HomeSolutions extends StatelessWidget {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Home Solutions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
