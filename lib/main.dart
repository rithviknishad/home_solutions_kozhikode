import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/main.gr.dart';
import 'package:home_solutions_kozhikode/routes/about.dart';
import 'package:home_solutions_kozhikode/routes/contact.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';
import 'package:home_solutions_kozhikode/routes/products.dart';
import 'package:home_solutions_kozhikode/routes/services.dart';

void main() => runApp(HomeSolutions());

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

class HomeSolutions extends StatelessWidget {
  static final router = AppRouter();

  static const primaryColor = const Color(0xff243f8f);
  static const accentColor = const Color(0xffe50053);
  static const subtleWhite = Color(0xfffafafa);
  static const fontFamily = 'Ubuntu';
  static const textStyle = TextStyle(fontFamily: fontFamily);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Home Solutions',
      theme: ThemeData(
        // General Theme Setting
        fontFamily: fontFamily,
        primaryColor: primaryColor,
        accentColor: accentColor,

        // App Bar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),

        // Scaffold
        scaffoldBackgroundColor: subtleWhite,

        // Text Theme
        textTheme: const TextTheme(
          headline1: textStyle,
          headline2: textStyle,
          headline3: textStyle,
          headline4: textStyle,
          headline5: textStyle,
          headline6: textStyle,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: accentColor.withOpacity(0.35),
          cursorColor: accentColor,
        ),

        // Snack Bar
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
          contentTextStyle: textStyle.copyWith(
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),

        // Text Button Theme
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(subtleWhite),
            textStyle:
                MaterialStateProperty.all(textStyle.copyWith(fontSize: 18)),
          ),
        ),

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            foregroundColor: MaterialStateProperty.all(accentColor),
            shape: MaterialStateProperty.all(StadiumBorder()),
            textStyle: MaterialStateProperty.all(TextStyle(
              color: primaryColor,
              fontFamily: fontFamily,
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
          labelStyle: const TextStyle(color: accentColor, fontSize: 14),
          focusColor: Colors.transparent,
        ),
        ////////
      ),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
