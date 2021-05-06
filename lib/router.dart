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
    AutoRoute(page: ProductsPage, path: '/products', name: "Products"),
    AutoRoute(page: ServicesPage, path: '/services', name: "Services"),
    AutoRoute(page: AboutPage, path: '/about', name: "About"),
    AutoRoute(page: ContactPage, path: '/contact', name: "Contact"),
  ],
)
class $AppRouter {}
