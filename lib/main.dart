import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';
import 'package:home_solutions_kozhikode/routes/about_us.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';
import 'package:home_solutions_kozhikode/routes/products.dart';

void main() => runApp(HomeSolutions());

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: ProductsPage),
    AutoRoute(page: AboutUsPage),
  ],
)
class $AppRouter {}

class HomeSolutions extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Home Solutions',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: const Color(0xff243f8f),
        accentColor: const Color(0xffe50053),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xfffafafa),
        ),
        scaffoldBackgroundColor: const Color(0xfffafafa),
      ),
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
