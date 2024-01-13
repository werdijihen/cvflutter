import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../constraints/responsive.dart';
import '../../../constraints/strings.dart';
import '../../../providers/themeProvider.dart';

class ExperienceOne extends StatefulWidget {
  const ExperienceOne({Key? key}) : super(key: key);

  @override
  State<ExperienceOne> createState() => _ExperienceOneState();
}

class _ExperienceOneState extends State<ExperienceOne> {
  late Color linkColor;

  late Color title_color;

  late Color desColor;

  late Color hoberImageColor;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    title_color = themeProvider.isDarkMode ? lightest_salate_color : navy_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: experience1_title,
              style: TextStyle(
                  color: title_color,
                  fontSize: isDesktop(context) ? 26 : 18,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
                text: experience1_title_linl,
                style: TextStyle(
                    color: linkColor,
                    fontSize: isDesktop(context) ? 26 : 18,
                    fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()
                  ..onTap = launchExperienceSite),
          ]),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          experience1_duration,
          style: TextStyle(color: desColor),
        ),
        SizedBox(
          height: 16,
        ),

      ],
    );
  }



  Future launchExperienceSite() async {
    await launch(upStatement_url);
  }
}
