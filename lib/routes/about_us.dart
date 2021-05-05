import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
