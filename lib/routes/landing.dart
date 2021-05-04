import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
