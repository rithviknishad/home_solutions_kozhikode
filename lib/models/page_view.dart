import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebPageController extends ChangeNotifier {
  factory WebPageController.of(BuildContext context) =>
      Provider.of(context, listen: false);

  WebPageController({
    required this.pages,
  })   : assert(pages.isNotEmpty, "Should have atleast more than one page"),
        currentPage = pages.first;

  final List<WebpageMixin> pages;

  WebpageMixin currentPage;

  void navigateTo(WebpageMixin page) {
    currentPage = page;
    notifyListeners();
  }
}

mixin WebpageMixin on StatelessWidget {
  String get name;
}

class Webpage extends StatelessWidget with WebpageMixin {
  final Widget child;
  final String name;

  const Webpage(this.name, {required this.child});

  build(_) => child;
}
