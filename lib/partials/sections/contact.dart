import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/link.dart';

class ContactSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: sectionPadding(size),
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text(
            "GET IN TOUCH WITH US TODAY !",
            style: TextStyle(
              color: theme.primaryColor.withAlpha(160),
              fontSize: 26,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),

          // Email
          SizedBox(height: 60),
          ...mailingAddressWidgets(context),

          // Contact Number
          SizedBox(height: 60),
          ...contactNumbersWidgets(context),

          // WhatsApp
          SizedBox(height: 60),
          ...chatWithUsWidgets(context),
        ],
      ),
    );
  }

  List<Widget> mailingAddressWidgets(BuildContext context) {
    final theme = Theme.of(context);

    return [
      Icon(
        Ionicons.mail_open_outline,
        size: 64,
        color: theme.primaryColorDark,
      ),
      SizedBox(height: 30),
      for (final id in HomeSolutions.MailingIds)
        Link(
          uri: Uri(scheme: 'mailto', path: id),
          builder: (_, followLink) => TextButton(
            onPressed: followLink,
            child: Text(
              id,
              style: TextStyle(
                fontSize: 16,
                color: theme.primaryColor.withAlpha(200),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    ];
  }

  List<Widget> contactNumbersWidgets(BuildContext context) {
    final theme = Theme.of(context);

    return [
      Icon(
        Ionicons.call_outline,
        size: 64,
        color: theme.primaryColorDark,
      ),
      SizedBox(height: 30),
      for (final number in HomeSolutions.ContactNumbers)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Link(
            uri: Uri(scheme: 'tel', path: number),
            builder: (_, followLink) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: followLink,
                    child: Text(
                      '$number   |   CALL NOW',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColor.withAlpha(200),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
    ];
  }

  List<Widget> chatWithUsWidgets(BuildContext context) {
    final theme = Theme.of(context);

    return [
      Icon(
        Ionicons.chatbubbles_outline,
        size: 64,
        color: theme.primaryColorDark,
      ),
      SizedBox(height: 30),
      Link(
        uri: Uri(scheme: 'wa.me', path: ""),
        builder: (_, followLink) => TextButton(
          onPressed: followLink,
          child: Text(
            "WhatsApp",
            style: TextStyle(
              fontSize: 16,
              color: theme.primaryColor.withAlpha(200),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
  }

  EdgeInsets sectionPadding(Size size) => EdgeInsets.symmetric(
      horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10);
}
