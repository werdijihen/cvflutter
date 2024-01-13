import 'package:jihen/constraints/colors.dart';
import 'package:jihen/constraints/strings.dart';
import 'package:jihen/providers/themeProvider.dart';
import 'package:jihen/widgets/light_Dark_mode.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constraints/responsive.dart';
import '../pages/sections/competence/CompetencesCertifications.dart';
import '../pages/sections/home/Home.dart';
import 'navbar/navItem.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final logo_ = themeprovider.isDarkMode ? dark_mode_logo : light_mode_logo;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: isMobile(context)
                  ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  logo_,
                  width: 50,
                  height: 50,
                ),
              )
                  : Image.asset(
                logo_,
                width: 50,
                height: 50,
              ),
            ),
            if (!isMobile(context))
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(right: isTab(context) ? 30 : 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Light_Dark_Mode(),
                      NavItem(
                        index: about_index,
                        title: about_,
                        itemIndex: 1, onItemClicked: () {  },
                      ),
                      NavItem(
                        index: experience_index,
                        title: experience_,
                        itemIndex: 2, onItemClicked: () {  },
                      ),
                      NavItem(
                        index: work_index,
                        title: work_,
                        itemIndex: 3, onItemClicked: () {  },
                      ),
                      NavItem(
                        index: contact_index,
                        title: contact_,
                        itemIndex: 4, onItemClicked: () {  },
                      ),
                      NavItem(
                        index: education_index,
                        title: education_,
                        itemIndex: 5, onItemClicked: () {  },
                      ),
                      NavItem(
                        index: education_index,
                        title: 'Compétences & Certifications',
                        itemIndex: 6,
                        onItemClicked: () {
                          // Logique de navigation spécifique à "Compétences & Certifications"
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) => CompetencesCertificationsPage()),
                          // );
                        },
                      ),

                      SizedBox(width: 8),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            themeprovider.isDarkMode
                                ? index_color.withOpacity(0.2)
                                : light_index_color.withOpacity(0.2),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                              color: themeprovider.isDarkMode
                                  ? index_color
                                  : light_index_color,
                            ),
                          ),
                        ),
                        onPressed: () {
                          launchResume();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            'Resume',
                            style: TextStyle(
                              fontSize: isMobile(context)
                                  ? 14
                                  : isTab(context)
                                  ? 12
                                  : 14,
                              color: themeprovider.isDarkMode
                                  ? index_color
                                  : light_index_color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (isMobile(context))
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: themeprovider.isDarkMode
                            ? index_color
                            : navy_color,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

  }

  Future<void> launchResume() async {
    await launch('assets/CV.png');
  }
}
