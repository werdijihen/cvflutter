import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:jihen/providers/themeProvider.dart';
import 'package:url_launcher/url_launcher.dart';

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
}

Future<void> launchUrl(String url) async {
  await launch(url);
}
