import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/wrapper.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PageWrapper(
      page: SizedBox.fromSize(
        size: size,
        child: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
