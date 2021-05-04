// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'routes/about_us.dart' as _i5;
import 'routes/landing.dart' as _i3;
import 'routes/products.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.LandingPage());
    },
    ProductsRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ProductsPage());
    },
    AboutUsRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.AboutUsPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingRoute.name, path: '/'),
        _i1.RouteConfig(ProductsRoute.name, path: '/products-page'),
        _i1.RouteConfig(AboutUsRoute.name, path: '/about-us-page')
      ];
}

class LandingRoute extends _i1.PageRouteInfo {
  const LandingRoute() : super(name, path: '/');

  static const String name = 'LandingRoute';
}

class ProductsRoute extends _i1.PageRouteInfo {
  const ProductsRoute() : super(name, path: '/products-page');

  static const String name = 'ProductsRoute';
}

class AboutUsRoute extends _i1.PageRouteInfo {
  const AboutUsRoute() : super(name, path: '/about-us-page');

  static const String name = 'AboutUsRoute';
}
