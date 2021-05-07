import 'package:auto_route/auto_route.dart';
import 'package:home_solutions_kozhikode/routes/about.dart';
import 'package:home_solutions_kozhikode/routes/contact.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';
import 'package:home_solutions_kozhikode/routes/products.dart';
import 'package:home_solutions_kozhikode/routes/services.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LandingPage, initial: true, name: "Home"),
  ],
)
class $AppRouter {}
