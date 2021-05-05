import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/models/page_view.dart';
import 'package:provider/provider.dart';

class MultiPageWebsite extends StatelessWidget {
  final List<WebpageMixin> pages;
  final PreferredSizeWidget Function(BuildContext context) navBarBuilder;

  MultiPageWebsite({
    required this.pages,
    required this.navBarBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WebPageController(pages: pages),
      builder: (context, child) {
        final controller = WebPageController.of(context);
        final size = MediaQuery.of(context).size;
        final theme = Theme.of(context);
        print(controller.currentPage.name);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(116.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlue[900]!,
                    Colors.lightBlue[300]!,
                  ],
                ),
              ),
              // color: theme.appBarTheme.backgroundColor,
              child: Row(
                children: [
                  Spacer(flex: 3),

                  // Home Solutions LOGO
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 40, 16),
                    child: Material(
                      elevation: 4,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/logo_borderless.png',
                        height: 116,
                        isAntiAlias: true,
                      ),
                    ),
                  ),

                  // Home Solutions Title
                  if (size.width > 600)
                    Text(
                      "Home Solutions",
                      style: theme.textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black26, blurRadius: 12)
                          ]),
                    ),

                  Spacer(flex: 9),

                  // Navigation Buttons
                  for (final page in controller.pages) ...[
                    WebpageButton(page),
                    const Spacer(flex: 1),
                  ],

                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
          body: controller.currentPage,
        );
      },
    );
  }
}

class WebpageButton extends StatelessWidget {
  final WebpageMixin page;

  const WebpageButton(this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: ButtonStyle(
          // overlayColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder()),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(page.name),
        ),
        onPressed: () => WebPageController.of(context).navigateTo(page),
      ),
    );
  }
}
