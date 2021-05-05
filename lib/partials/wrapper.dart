import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';

class PageWrapper extends StatelessWidget {
  final Widget page;

  const PageWrapper({
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(118),
        child: MyNavigationBar(),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: page,
        ),
      ),
    );
  }
}
