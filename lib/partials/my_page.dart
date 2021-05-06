import 'package:auto_route/auto_route.dart';

class MyPage {
  final String name;
  final PageRouteInfo Function() opens;

  const MyPage(this.name, {required this.opens});
}
