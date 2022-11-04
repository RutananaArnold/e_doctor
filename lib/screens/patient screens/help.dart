import 'package:e_doctor/constants/color_pallete.dart';
import 'package:e_doctor/widgets/tab_button.dart';
import 'package:e_doctor/widgets/tab_label.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              const TabLabel(
                label: 'About eDoctor',
                color: kappSecondary,
                align: Alignment.centerLeft,
              ),
              TabButton(
                label: 'FAQs',
                color: kappPrimary,
                icon: Icons.help_outline,
                weight: FontWeight.w400,
                page: () {},
              ),
              Column(
                children: [
                  SizedBox(height: size.height * 0.05),
                  const TabLabel(
                      label: 'Contact Us',
                      color: kappSecondary,
                      align: Alignment.centerLeft),
                  const SizedBox(height: 10.0),
                  TabButton(
                      label: 'Call Help line',
                      color: kappPrimary,
                      icon: Icons.phone_forwarded_outlined,
                      weight: FontWeight.w400,
                      page: () => {}),
                  const Divider(
                      indent: 20.0,
                      endIndent: 25.0,
                      color: kappPrimary,
                      height: 1.0),
                  TabButton(
                      label: 'Report a problem',
                      color: kappPrimary,
                      icon: Icons.email_outlined,
                      weight: FontWeight.w400,
                      page: () {}),
                  const Divider(
                    indent: 20.0,
                    endIndent: 25.0,
                    color: kappPrimary,
                    height: 1.0,
                  ),
                  TabButton(
                      label: 'Send Feedback',
                      color: kappPrimary,
                      icon: Icons.feedback_outlined,
                      weight: FontWeight.w400,
                      page: () {}),
                  const Divider(
                    indent: 20.0,
                    endIndent: 25.0,
                    color: kappPrimary,
                    height: 1.0,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              const TabLabel(
                label: 'App Info',
                color: kappSecondary,
                align: Alignment.centerLeft,
              ),
              const SizedBox(height: 10.0),
              const TabButton(
                label: 'App Version',
                color: kappPrimary,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
      );
    });
  }
}
