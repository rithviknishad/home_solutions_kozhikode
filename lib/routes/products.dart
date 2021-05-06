import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/wrapper.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PageWrapper(
      child: SizedBox.fromSize(
        size: size,
        child: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
