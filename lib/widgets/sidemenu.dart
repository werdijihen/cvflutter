import 'package:jihen/constraints/colors.dart';
import 'package:jihen/providers/themeProvider.dart';
import 'package:jihen/widgets/light_Dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import '../constraints/responsive.dart';
import '../constraints/strings.dart';
import 'navbar/navItem.dart';

//to show the menu item only for mobile screen
// ... (import statements remain the same)

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final bg_color = themeprovider.isDarkMode ? navy_color : myWhite;

    return Container(
      height: double.infinity,
      color: bg_color,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ... (existing code remains the same)

              SizedBox(
                height: 10,
              ),
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
                      color: themeprovider.isDarkMode ? index_color : light_index_color,
                    ),
                  ),
                ),
                onPressed: () {
                  launchResume();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Resume',
                    style: TextStyle(
                      fontSize: isMobile(context) ? 14 : isTab(context) ? 12 : 14,
                      color: themeprovider.isDarkMode ? index_color : light_index_color,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: themeprovider.isDarkMode ? light_navy_color : lightest_salate_color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(child: Light_Dark_Mode()),
                  ),
                  SizedBox(width: 12),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: themeprovider.isDarkMode ? light_navy_color : lightest_salate_color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchResume() async {
    await launch('assets/CV.png');
  }
}
