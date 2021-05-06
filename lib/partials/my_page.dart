import 'package:auto_route/auto_route.dart';

class MyPage {
  final String name;
  final PageRouteInfo Function() opens;

  const MyPage(this.name, {required this.opens});

  void open({required StackRouter using}) {
    final route = opens();
    if (route.routeName != using.current.name) using.push(route);
  }
}
