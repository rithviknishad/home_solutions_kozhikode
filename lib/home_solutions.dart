import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/constants/theme.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/router.gr.dart';

class HomeSolutions extends StatelessWidget {
  static const MailingIds = [
    "4homesolutionsclt@gmail.com",
  ];

  // Key: Number, Value: Has Whatsapp linked.
  static const ContactNumbers = {
    "+91 9048-336656": false,
    "+91 9048-336657": false,
    "+91 9048-336658": true,
  };

  static const WhatsappNumbers = [
    "+91 9048-336658",
  ];

  static final List<MyPage> pages = [];

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
      // headlines
      headline1: textStyle,
      headline2: textStyle,
      headline3: TextStyle(fontFamily: fontFamily, letterSpacing: 2.0),
      headline4: TextStyle(
          fontFamily: fontFamily,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w500),
      headline5: textStyle,
      headline6: textStyle,
      // subtitles
      subtitle1: TextStyle(fontFamily: fontFamily, letterSpacing: 2.0),
      subtitle2: TextStyle(fontFamily: fontFamily, letterSpacing: 2.0),
      // body
      bodyText1:
          TextStyle(fontFamily: fontFamily, fontSize: 20, letterSpacing: 0),
      bodyText2:
          TextStyle(fontFamily: fontFamily, fontSize: 18, letterSpacing: 0),

      button:
          TextStyle(fontFamily: fontFamily, fontSize: 18, letterSpacing: 1.5),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: accentColor.withOpacity(0.35),
      cursorColor: accentColor,
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryColor,
      contentTextStyle: textStyle.copyWith(
        letterSpacing: 0.5,
        color: Colors.white,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(primaryColor),
    )),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(accentColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
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
