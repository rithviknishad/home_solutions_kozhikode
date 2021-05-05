import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/navigation_bar.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyNavigationBar(),
              SizedBox.fromSize(
                size: size,
                child: Center(
                  child: Text("Hello"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
