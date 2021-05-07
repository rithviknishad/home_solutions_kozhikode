import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:url_launcher/link.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Banner // TODO: replace gradient with store image
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[200]!, Colors.grey[800]!],
              ),
            ),
            height: 300,
            child: Center(
              child: Text(
                "CONTACT HOME SOLUTIONS TODAY !",
                style: theme.textTheme.headline3?.apply(color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 70),

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
