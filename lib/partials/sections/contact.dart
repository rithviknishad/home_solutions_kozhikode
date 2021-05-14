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
      ).copyWith(top: 30, bottom: 60),
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
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: [
              Link(
                uri: Uri(scheme: 'mailto', path: id),
                builder: (_, followLink) => TextButton(
                  onPressed: followLink,
                  child: Text(
                    id,
                    style: TextStyle(color: theme.primaryColor.withAlpha(200)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
            Ionicons.chatbubbles_outline,
            size: 64,
            color: theme.primaryColorDark,
          ),
        ),

        // Contact Details
        for (final entry in HomeSolutions.contactNumbers.entries)
          SizedBox(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  style: TextStyle(color: theme.primaryColor),
                ),
                ButtonBar(
                  children: [
                    for (final method in entry.value.entries)
                      Link(
                        uri: method.value,
                        builder: (context, followLink) {
                          return IconButton(
                            icon: _contactIcon[method.key]!,
                            tooltip: _tooltip[method.key],
                            color: theme.primaryColorDark,
                            onPressed: followLink,
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  static final _contactIcon = {
    'call': Icon(Ionicons.call_outline),
    'sms': Icon(Ionicons.chatbox_ellipses_outline),
    'whatsapp': Icon(
      Ionicons.logo_whatsapp,
      color: Color(0xff31d26e),
    ),
  };

  static final _tooltip = {
    'call': 'Call Now',
    'sms': 'Send an SMS',
    'whatsapp': 'Message in WhatsApp'
  };
}
