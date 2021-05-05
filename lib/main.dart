import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/models/page_view.dart';
import 'package:home_solutions_kozhikode/partials/multi_page_website.dart';
import 'package:home_solutions_kozhikode/routes/about_us.dart';
import 'package:home_solutions_kozhikode/routes/contact.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';
import 'package:home_solutions_kozhikode/routes/products.dart';
import 'package:home_solutions_kozhikode/routes/services.dart';

void main() => runApp(HomeSolutions());

class HomeSolutions extends StatelessWidget {
  static const primaryColor = const Color(0xff243f8f);
  static const accentColor = const Color(0xffe50053);
  static const subtleWhite = Color(0xfffafafa);
  static const fontFamily = 'Ubuntu';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          headline1: const TextStyle(fontFamily: fontFamily),
          headline2: const TextStyle(fontFamily: fontFamily),
          headline3: const TextStyle(fontFamily: fontFamily),
          headline4: const TextStyle(fontFamily: fontFamily),
          headline5: const TextStyle(fontFamily: fontFamily),
          headline6: const TextStyle(fontFamily: fontFamily),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: accentColor.withOpacity(0.35),
          cursorColor: accentColor,
        ),

        // Snack Bar
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
          contentTextStyle: TextStyle(
            fontFamily: fontFamily,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),

        // Text Button Theme
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(subtleWhite),
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
      initialRoute: '/',
      routes: {
        '/': (context) => MultiPageWebsite(
              navBarBuilder: buildNavBar,
              pages: [
                Webpage("Home", child: LandingPage()),
                Webpage("About", child: AboutPage()),
                Webpage("Products", child: ProductsPage()),
                Webpage("Services", child: ServicesPage()),
                Webpage("Contact", child: ContactPage()),
              ],
            ),
      },
    );
  }

  PreferredSize buildNavBar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final pageController = WebPageController.of(context);

    return PreferredSize(
      preferredSize: Size.fromHeight(116.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue[900]!,
              Colors.lightBlue[300]!,
            ],
          ),
        ),
        // color: theme.appBarTheme.backgroundColor,
        child: Row(
          children: [
            Spacer(flex: 3),

            // Home Solutions LOGO
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 40, 16),
              child: Material(
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/logo_borderless.png',
                  height: 116,
                  isAntiAlias: true,
                ),
              ),
            ),

            // Home Solutions Title
            if (size.width > 600)
              Text(
                "Home Solutions",
                style: theme.textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black26, blurRadius: 12)]),
              ),

            Spacer(flex: 9),

            // Navigation Buttons
            for (final page in pageController.pages) ...[
              WebpageButton(page),
              const Spacer(flex: 1),
            ],

            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class WebpageButton extends StatelessWidget {
  final WebpageMixin page;

  const WebpageButton(this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: ButtonStyle(
          // overlayColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder()),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(page.name),
        ),
        onPressed: () => WebPageController.of(context).navigateTo(page),
      ),
    );
  }
}
