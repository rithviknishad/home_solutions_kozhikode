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

  static const _primary = const Color(0xff243f8f);
  static const _accent = const Color(0xffe50053);
  static const _subtleWhite = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Home Solutions',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: _primary,
        accentColor: _accent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: _subtleWhite,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
            foregroundColor: MaterialStateProperty.all(_primary),
          ),
        ),

        ////////
        textTheme: const TextTheme(
          headline1: const TextStyle(fontFamily: 'Ubuntu'),
          headline2: const TextStyle(fontFamily: 'Ubuntu'),
          headline3: const TextStyle(fontFamily: 'Ubuntu'),
          headline4: const TextStyle(fontFamily: 'Ubuntu'),
          headline5: const TextStyle(fontFamily: 'Ubuntu'),
          headline6: const TextStyle(fontFamily: 'Ubuntu'),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: _accent.withOpacity(0.35),
          cursorColor: _accent,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _primary,
          contentTextStyle: TextStyle(
            fontFamily: 'Ubuntu',
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_primary),
            foregroundColor: MaterialStateProperty.all(_accent),
            shape: MaterialStateProperty.all(StadiumBorder()),
            textStyle: MaterialStateProperty.all(TextStyle(
              color: _primary,
              fontFamily: 'Ubuntu',
              letterSpacing: 0.5,
            )),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          labelStyle: const TextStyle(color: _accent, fontSize: 14),
          focusColor: Colors.transparent,
        ),
        ////////
      ),
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
