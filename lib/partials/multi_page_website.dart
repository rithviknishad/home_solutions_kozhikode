import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/models/page_view.dart';
import 'package:provider/provider.dart';

class MultiPageWebsite extends StatelessWidget {
  final WebPageController controller;
  final PreferredSizeWidget Function(BuildContext context) navBarBuilder;

  MultiPageWebsite({
    required List<WebpageMixin> pages,
    required this.navBarBuilder,
  }) : controller = WebPageController(pages: pages);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      builder: (context, _) {
        final controller = WebPageController.of(context);

        return Scaffold(
          appBar: navBarBuilder(context),
          body: controller.currentPage,
        );
      },
    );
  }
}
