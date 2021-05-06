import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/router.gr.dart';

class HomeSolutions extends StatelessWidget {
  static const MailingIds = [
    "4homesolutions@gmail.com",
  ];

  static const ContactNumbers = [
    "+91 9048-336656",
    "+91 9048-336657",
    "+91 9048-336658",
  ];

  static const WhatsappNumbers = [
    "+91 9048-336658",
  ];

  static final List<MyPage> pages = [
    MyPage(
      name: "Home",
      icon: Icon(Icons.home_work_outlined),
      opens: () => Home(),
    ),
    MyPage(
      name: "Products",
      icon: Icon(Icons.shopping_bag),
      opens: () => Products(),
    ),
    MyPage(
      name: "Services",
      icon: Icon(Icons.handyman_outlined),
      opens: () => Services(),
    ),
    MyPage(
      name: "About",
      icon: Icon(Icons.info_outline),
      opens: () => About(),
    ),
    MyPage(
      name: "Contact",
      icon: Icon(Icons.contact_page_outlined),
      opens: () => Contact(),
    ),
  ];

  static final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Home Solutions',
      theme: _theme,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }

  static const primaryColor = const Color(0xff243f8f);
  static const accentColor = const Color(0xffe50053);
  static const subtleWhite = Color(0xfffafafa);
  static const fontFamily = 'Ubuntu';
  static const textStyle = TextStyle(fontFamily: fontFamily);

  static final _theme = ThemeData(
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
    canvasColor: subtleWhite,

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
        textStyle: MaterialStateProperty.all(textStyle.copyWith(fontSize: 18)),
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
  );
}
