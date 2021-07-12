import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:home_solutions_kozhikode/main.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _tileWidth = min(size.width, 330.0);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1C3559),
            Color(0xFF051937),
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
            child: FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 300),
                offset: Duration(milliseconds: 300),
              ),
              child: Text(
                "GET IN TOUCH WITH US TODAY !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ContactUsForm(key: Key('contact_us_form')),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 60,
            runSpacing: 60,
            children: [
              // Mail Us
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 800),
                  offset: Duration(milliseconds: 800),
                ),
                child: SizedBox(
                  width: _tileWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Link(
                        uri: Uri(
                          scheme: 'mailto',
                          path: HomeSolutions.mailingIds.first,
                        ),
                        builder: (_, followLink) => TextButton(
                          onPressed: followLink,
                          child: Icon(
                            Ionicons.mail_open_outline,
                            size: 32,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "mail us at ",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          letterSpacing: 1,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      SelectableText(
                        HomeSolutions.mailingIds.first,
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Call / SMS us
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 800),
                  offset: Duration(milliseconds: 1000),
                ),
                child: SizedBox(
                  width: _tileWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInUp(
                        preferences: slowAnimation,
                        child: Icon(
                          Ionicons.call_outline,
                          size: 32,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "speak with us ",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          letterSpacing: 1,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      for (final entry in HomeSolutions.contactNumbers.entries)
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText(
                                entry.key,
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 8),
                              for (final method in entry.value.entries)
                                if (method.key != "whatsapp")
                                  Link(
                                    uri: method.value,
                                    builder: (_, followLink) => IconButton(
                                      icon: _contactIcon[method.key]!,
                                      tooltip: _tooltip[method.key],
                                      color: Colors.lightBlueAccent,
                                      onPressed: followLink,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Message us
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 800),
                  offset: Duration(milliseconds: 1200),
                ),
                child: SizedBox(
                  width: _tileWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInUp(
                        preferences: slowAnimation,
                        child: Icon(
                          Ionicons.chatbubbles_outline,
                          size: 32,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "message us",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          letterSpacing: 1,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Link(
                        uri: HomeSolutions.whatsAppUri,
                        target: LinkTarget.blank,
                        builder: (_, followLink) => TextButton.icon(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Color(0xFF31D26E),
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 26,
                            ),
                          ),
                          onPressed: followLink,
                          icon: _contactIcon['whatsapp']!,
                          label: Text(
                            "in WhatsApp",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static final _contactIcon = {
    'call': Icon(Ionicons.call_outline),
    'sms': Icon(Ionicons.chatbox_ellipses_outline),
    'whatsapp': Icon(Ionicons.logo_whatsapp),
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

  final formKey = GlobalKey<FormState>();

  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    if (sent) {
      return Container(
        key: Key('contact_us_form_sent'),
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade700,
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
      key: Key('contact_us_form_no_sent_root'),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
        key: formKey,
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
                validator: (value) {
                  value ??= "";

                  if (value.trim().isEmpty) {
                    return "Specify a name";
                  }
                },
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
                child: FadeIn(
                  preferences: const AnimationPreferences(
                    duration: Duration(milliseconds: 700),
                    offset: Duration(seconds: 2),
                  ),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendMail() async {
    if ((formKey.currentState?.validate() ?? false) == false) return;

    final clientName = nameController.text;

    var clientEmail = emailController.text;
    if (clientEmail.trim().isEmpty) clientEmail = "(not provided)";

    var clientPhone = phoneNumberController.text;
    if (clientPhone.trim().isEmpty) clientPhone = "(not provided)";

    final comment = commentController.text;

    final link = Mailto(
      to: HomeSolutions.mailingIds,
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
