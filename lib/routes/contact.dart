import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/wrapper.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageWrapper(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Banner(),
            SizedBox(height: 50),
            _ContactInformation(),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[200]!, Colors.grey[800]!],
        ),
      ),
      height: 300,
      child: Center(
        child: Text(
          "CONTACT",
          style: theme.textTheme.headline3?.apply(
            fontWeightDelta: 300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ContactInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 800,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 50,
        crossAxisSpacing: 50,
        children: [
          _MailingIds(),
          _ContactNumbers(),
        ],
      ),
    );
  }
}

class _MailingIds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "SEND US A MAIL",
          style: theme.textTheme.subtitle2?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        SizedBox(height: 20),
        for (final id in HomeSolutions.MailingIds)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              id,
              style: theme.textTheme.headline6?.copyWith(
                letterSpacing: 1.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
      ],
    );
  }
}

class _ContactNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "TALK TO US",
          style: theme.textTheme.subtitle2?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        SizedBox(height: 20),
        for (final id in HomeSolutions.ContactNumbers)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              id,
              style: theme.textTheme.headline6?.copyWith(
                letterSpacing: 1.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
      ],
    );
  }
}
