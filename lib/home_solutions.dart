import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/router.gr.dart';

class HomeSolutions extends StatelessWidget {
  static const MailingIds = [
    "4homesolutionsclt@gmail.com",
  ];

  static const ContactNumbers = {
    "+91 9048-336656",
    "+91 9048-336657",
    "+91 9048-336658",
  };

  static const WhatsappNumber = "+91 9048-336658";

  static const catchPrase = "We take care of your needs...";

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

  static const primaryColor = const Color(0xff243f8f);
  static const accentColor = const Color(0xff12143c);
  static const subtleWhite = Color(0xfffafafa);
  static const fontFamily = 'Poppins';
  static const textStyle = TextStyle(fontFamily: fontFamily);

  static final _theme = ThemeData(
    // General Theme Setting
    fontFamily: fontFamily,
    primaryColor: primaryColor,
    accentColor: accentColor,

    // Scaffold
    scaffoldBackgroundColor: subtleWhite,
    canvasColor: subtleWhite,

    // Text Theme
    textTheme:
        TextTheme(caption: TextStyle(fontFamily: 'Lemonada', fontSize: 32)),

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

    // textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //   foregroundColor: MaterialStateProperty.all(primaryColor),
    // )),

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
