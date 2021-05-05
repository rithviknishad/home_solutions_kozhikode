// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'routes/about.dart' as _i6;
import 'routes/contact.dart' as _i7;
import 'routes/landing.dart' as _i3;
import 'routes/products.dart' as _i4;
import 'routes/services.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.LandingPage(),
          opaque: true,
          barrierDismissible: false);
    },
    Products.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.ProductsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    Services.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.ServicesPage(),
          opaque: true,
          barrierDismissible: false);
    },
    About.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.AboutPage(),
          opaque: true,
          barrierDismissible: false);
    },
    Contact.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.ContactPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(Home.name, path: '/'),
        _i1.RouteConfig(Products.name, path: '/products'),
        _i1.RouteConfig(Services.name, path: '/services'),
        _i1.RouteConfig(About.name, path: '/about'),
        _i1.RouteConfig(Contact.name, path: '/contact')
      ];
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: '/');

  static const String name = 'Home';
}

class Products extends _i1.PageRouteInfo {
  const Products() : super(name, path: '/products');

  static const String name = 'Products';
}

class Services extends _i1.PageRouteInfo {
  const Services() : super(name, path: '/services');

  static const String name = 'Services';
}

class About extends _i1.PageRouteInfo {
  const About() : super(name, path: '/about');

  static const String name = 'About';
}

class Contact extends _i1.PageRouteInfo {
  const Contact() : super(name, path: '/contact');

  static const String name = 'Contact';
}
