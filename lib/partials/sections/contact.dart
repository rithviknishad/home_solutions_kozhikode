import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:url_launcher/link.dart';

class ContactSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: sectionPadding(size),
      height: size.height * 0.9,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(theme),

          // SizedBox(height: 45),

          // All Contact Information
          Container(
            width: 900,
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
          ),
        ],
      ),
    );
  }

  EdgeInsets sectionPadding(Size size) => EdgeInsets.symmetric(
      horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10);

  Widget title(ThemeData theme) => Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Text(
          "GET IN TOUCH WITH US TODAY !",
          style: TextStyle(
            color: theme.primaryColor.withAlpha(160),
            fontSize: 26,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      );
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
          "SEND US AN EMAIL . . .",
          style: theme.textTheme.subtitle1?.apply(color: theme.primaryColor),
        ),
        SizedBox(height: 20),
        for (final id in HomeSolutions.MailingIds)
          Link(
            uri: Uri(scheme: 'mailto', path: id),
            builder: (_, followLink) => TextButton.icon(
              onPressed: followLink,
              icon: Icon(Icons.mail_rounded),
              label: Text(id),
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
          "TALK TO US . . .",
          style: theme.textTheme.subtitle1?.apply(color: theme.primaryColor),
        ),
        SizedBox(height: 20),
        for (final entry in HomeSolutions.ContactNumbers.entries)
          Row(
            children: [
              Icon(Icons.call, color: theme.primaryColor),
              SizedBox(width: 16, height: 40),
              Text(entry.key),
              Link(
                uri: Uri(scheme: 'tel', path: entry.key),
                builder: (_, followLink) =>
                    TextButton(onPressed: followLink, child: Text("CALL")),
              ),
              if (entry.value)
                Link(
                  uri: Uri(scheme: 'tel', path: entry.key),
                  builder: (_, followLink) => TextButton(
                    onPressed: followLink,
                    child: Text("WhatsApp"),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
