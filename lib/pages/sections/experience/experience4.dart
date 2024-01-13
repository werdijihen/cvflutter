import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../constraints/responsive.dart';
import '../../../constraints/strings.dart';
import '../../../providers/themeProvider.dart';

class ExperienceFour extends StatefulWidget {
  const ExperienceFour({Key? key}) : super(key: key);

  @override
  State<ExperienceFour> createState() => _ExperienceFourState();
}

class _ExperienceFourState extends State<ExperienceFour> {
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
              text: experience4_title,
              style: TextStyle(
                  color: title_color,
                  fontSize: isDesktop(context) ? 26 : 18,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
                text: experience4_title_linl,
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
          experience4_duration,
          style: TextStyle(color: desColor),
        ),
        SizedBox(
          height: 16,
        ),
        buildDescription(experience4_des1),
        SizedBox(
          height: 16,
        ),
        buildDescription(experience4_des2),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget buildDescription(String des) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.play_arrow,
          color: linkColor,
          size: 12,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: AutoSizeText(
          des,
          style: TextStyle(color: desColor),
          maxLines: 6,
        )),
      ],
    );
  }

  Future launchExperienceSite() async {
    await launch(scout_url);
  }
}
