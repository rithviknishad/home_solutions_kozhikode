import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/wrapper.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banner

            Container(
              color: Colors.red,
              width: 1100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hi"),
                  Text("Hi"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
