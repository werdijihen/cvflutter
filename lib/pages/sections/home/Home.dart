import 'package:auto_size_text/auto_size_text.dart';
import 'package:jihen/constraints/colors.dart';
import 'package:jihen/constraints/responsive.dart';
import 'package:jihen/constraints/strings.dart';
import 'package:jihen/providers/themeProvider.dart';
import 'package:jihen/widgets/hoverUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),

          // Say hi
          Text(
            home_hi_text,
            style: TextStyle(
              fontSize: 18,
              color: themeProvider.isDarkMode ? index_color : light_index_color,
            ),
          ),
          SizedBox(height: 20),

          // Name text
          AutoSizeText(
            home_name,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: themeProvider.isDarkMode
                  ? lightest_salate_color
                  : dark_navy_color.withOpacity(0.7),
            ),
            maxLines: 1,
            minFontSize: isMobile(context) ? 36 : isTab(context) ? 52 : 72,
          ),

          // Title of my
          AutoSizeText(
            home_title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: themeProvider.isDarkMode
                  ? light_salate_color
                  : navy_color.withOpacity(0.6),
            ),
            maxLines: 2,
            minFontSize: isMobile(context) ? 36 : isTab(context) ? 52 : 72,
          ),
          SizedBox(height: 16),

          // My description
          Container(
            width: isMobile(context) ? size.width : size.width / 3,
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: home_description,
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? salate_color
                          : light_navy_color.withOpacity(0.6),
                    ),
                  ),
                  TextSpan(
                    text: home_des_link_text,
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? index_color
                          : light_index_color,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()..onTap = launchUpstatement,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),

          // Course button


          // For some space
          SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget buildOutlinedButton(BuildContext context, ThemeProvider themeProvider) {
    return isMobile(context)
        ? OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: themeProvider.isDarkMode ? index_color : light_index_color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        launchCourse();
      },
      child: Text(
        home_button,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: themeProvider.isDarkMode ? index_color : light_index_color,
        ),
      ),
    )
        : HoverUp(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: themeProvider.isDarkMode ? index_color : light_index_color,
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          launchCourse();
        },
        child: Text(
          home_button,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: themeProvider.isDarkMode ? index_color : light_index_color,
          ),
        ),
      ),
    );
  }

  Future launchCourse() async {
    await launch(course_url);
  }

  Future launchUpstatement() async {
    await launch(upStatement_url);
  }

}
