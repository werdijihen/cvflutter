// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:jihen/constraints/responsive.dart';
import 'package:jihen/constraints/strings.dart';
import 'package:jihen/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../providers/themeProvider.dart';

class ContactSection extends StatefulWidget {
  ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  late Color linkColor;
  late Color titleColor;
  late Color descColor;
  late Color hoverImageColor;

  @override
  Widget build(BuildContext context) {
    // Change title and link color for light and dark mode
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    titleColor = themeProvider.isDarkMode ? lightest_salate_color : navy_color;
    descColor = themeProvider.isDarkMode ? salate_color : light_navy_color;
    hoverImageColor = themeProvider.isDarkMode ? index_color : light_navy_color;

    return isMobile(context)
        ? contactBody(context)
        : Row(
      children: [
        Expanded(flex: 1, child: Center()),
        Expanded(flex: 4, child: contactBody(context)),
        Expanded(flex: 1, child: Center()),
      ],
    );
  }

  Widget contactBody(BuildContext context) {
    double titleFontSize = isMobile(context) ? 36 : isTab(context) ? 42 : 52;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(color: linkColor),
              children: [
                TextSpan(text: contact_index),
                TextSpan(text: contactIndexTitle),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            contact_title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          AutoSizeText(
            contact_des,
            style: TextStyle(
              color: descColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          helloButton(context),
          SizedBox(height: 200), // Give space from bottom
          FooterSection(), // Here I show a footer
        ],
      ),
    );
  }

  Widget helloButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: linkColor),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return linkColor.withOpacity(0.3);
              }
              return null;
            },
          ),
        ),
        onPressed: () {
          launchUrl(contact_url as Uri);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Text(
            contact_buttonName,
            style: TextStyle(color: linkColor, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

class CompetencesCertificationsPage extends StatelessWidget {
  final Map<String, int> competencesFlutter = {
    'Conception UI/UX avec Flutter': 90,
    'Gestion d\'état avec Provider et Bloc': 85,
    'Intégration de services Web et API REST': 88,
    'Animations et transitions': 80,
  };

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compétences en Flutter :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 16),
            for (var entry in competencesFlutter.entries)
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      entry.key,
                      style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: LinearPercentIndicator(
                      width: 150.0,
                      lineHeight: 14.0,
                      percent: entry.value / 100,
                      backgroundColor: Colors.white,
                      progressColor: themeProvider.isDarkMode ? Colors.blue : Colors.blue,
                      center: Text('${entry.value}%', style: TextStyle(color: textColor)),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> launchUrl(String url) async {
    await launch(url);
  }
}
