import 'package:auto_route/auto_route.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LandingPage, initial: true, name: "Home"),
  ],
)
class $AppRouter {}
