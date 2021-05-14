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
      padding: EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
        vertical: 30,
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: Text(
              "GET IN TOUCH WITH US TODAY !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.primaryColor.withAlpha(160),
                fontSize: 26,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              spacing: 60,
              runSpacing: 60,
              children: [
                mailingAddressWidget(context),
                contactNumbersWidget(context),
                chatWithUsWidget(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget mailingAddressWidget(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Icon(
            Ionicons.mail_open_outline,
            size: 64,
            color: theme.primaryColorDark,
          ),
        ),
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
      ],
    );
  }

  Widget contactNumbersWidget(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Icon(
            Ionicons.call_outline,
            size: 64,
            color: theme.primaryColorDark,
          ),
        ),

        // Contact Details
        for (final entry in HomeSolutions.contactNumbers.entries)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                entry.key,
                style: TextStyle(color: theme.primaryColor),
              ),
              SizedBox(width: 20),
              ButtonBar(
                children: [
                  for (final method in entry.value.entries)
                    Link(
                      uri: method.value,
                      builder: (context, followLink) {
                        return IconButton(
                          icon: _contactIcon(method.key),
                          color: theme.primaryColorDark,
                          onPressed: followLink,
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget _contactIcon(String contactMethod) {
    switch (contactMethod) {
      case 'call':
        return Icon(Icons.call);
      case 'sms':
        return Icon(Icons.sms);
      case 'whatsapp':
        return Icon(Icons.sms);
      default:
        return Container();
    }
  }

  Widget chatWithUsWidget(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Icon(
            Ionicons.chatbubbles_outline,
            size: 64,
            color: theme.primaryColorDark,
          ),
        ),
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
      ],
    );
  }
}
