import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/home_solutions.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade100,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
            child: FadeInUp(
              preferences: normalAnimation,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ContactUsForm(key: Key('contact_us_form')),
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
          child: FadeInUp(
            preferences: slowAnimation,
            child: Icon(
              Ionicons.mail_open_outline,
              size: 64,
              color: theme.primaryColorDark,
            ),
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
                  child: FadeInUp(
                    preferences: slowAnimation,
                    child: Text(
                      id,
                      style:
                          TextStyle(color: theme.primaryColor.withAlpha(200)),
                      textAlign: TextAlign.center,
                    ),
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
          child: FadeInUp(
            preferences: slowAnimation,
            child: Icon(
              Ionicons.chatbubbles_outline,
              size: 64,
              color: theme.primaryColorDark,
            ),
          ),
        ),

        // Contact Details
        for (final entry in HomeSolutions.contactNumbers.entries)
          FadeInUp(
            preferences: slowAnimation,
            child: SizedBox(
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

class _ContactUsForm extends StatefulWidget {
  const _ContactUsForm({Key? key}) : super(key: key);

  @override
  __ContactUsFormState createState() => __ContactUsFormState();
}

class __ContactUsFormState extends State<_ContactUsForm> {
  bool sent = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    if (sent) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.greenAccent.shade700,
              Colors.greenAccent.shade700,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 20,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        width: min(size.width - 20, 440),
        height: 320,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Sit back and relax,\nwe'll contact you ASAP.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      width: min(size.width - 20, 440),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Let us know how can we reach you',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  icon: Icon(Icons.person),
                ),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  icon: Icon(Icons.mail_outline_rounded),
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  icon: Icon(Icons.phone),
                ),
                controller: phoneNumberController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Anything you would like to say to us?',
                  icon: Icon(Icons.comment),
                ),
                controller: commentController,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: theme.primaryColorDark,
                    onPrimary: Colors.white,
                  ),
                  onPressed: sendMail,
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    child: Icon(Icons.send),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                    child: Text("Send"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendMail() async {
    final clientName = nameController.text;

    var clientEmail = emailController.text;
    if (clientEmail.trim().isEmpty) clientEmail = "(not provided)";

    var clientPhone = phoneNumberController.text;
    if (clientPhone.trim().isEmpty) clientPhone = "(not provided)";

    final comment = commentController.text;

    final link = Mailto(
      to: HomeSolutions.MailingIds,
      subject: 'Enquiry from $clientName',
      body: """
Home Solutions,

I, $clientName is trying to reach you.

$comment

Reach me by phone $clientPhone or by email $clientEmail.

Partially auto-generated email.
      """,
    );

    if (await canLaunch('$link')) {
      try {
        await launch('$link');
        setState(() => sent = true);
      } catch (_) {}
    }
  }
}
