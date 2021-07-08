import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/my_page.dart';
import 'package:home_solutions_kozhikode/router.gr.dart';

void main() => runApp(HomeSolutions());

class HomeSolutions extends StatelessWidget {
  static const mailingIds = [
    "4homesolutionsclt@gmail.com",
  ];

  /// `Map<String, Map<String, Uri>>`.
  ///
  /// ```yaml
  /// "display_value":
  ///   - call: Uri(...)
  ///   - sms: Uri(...)
  ///   - whatsapp: Uri(...)
  /// ```
  static final contactNumbers = {
    "+91 9048-336656": {
      'call': Uri(scheme: 'tel', path: '+91 9048-336656'),
      'sms': Uri(scheme: 'sms', path: '+91 9048-336656'),
    },
    "+91 9048-336657": {
      'call': Uri(scheme: 'tel', path: '+91 9048-336657'),
      'sms': Uri(scheme: 'sms', path: '+91 9048-336657'),
    },
    "+91 9048-336658": {
      'whatsapp': Uri(scheme: 'wa.me', path: '+91 9048-336658'),
      'call': Uri(scheme: 'tel', path: '+91 9048-336658'),
      'sms': Uri(scheme: 'sms', path: '+91 9048-336658'),
    },
  };

  static const whatsAppNumber = "+91 9048-336658";

  static const catchPhrase = "We take care of your needs...";

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

  static const fontFamily = 'Nunito';

  static const textStyle = TextStyle(fontFamily: fontFamily);

  static final _theme = ThemeData(
    fontFamily: fontFamily,
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: subtleWhite,
    canvasColor: subtleWhite,
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
      labelStyle: const TextStyle(
        color: accentColor,
        fontSize: 14,
      ),
      focusColor: Colors.transparent,
    ),
  );
}
