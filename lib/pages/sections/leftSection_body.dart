import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constraints/strings.dart';
import '../../widgets/socialMediaIcon/SocialMediaIcon.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionLeft extends StatelessWidget {
  const SectionLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            socialMediaIcon(fb_url, FontAwesomeIcons.facebookF, context),
            const SizedBox(height: 25,),
            socialMediaIcon(github_url, FontAwesomeIcons.github, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(instagram_url, FontAwesomeIcons.instagram, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(twitter_url, FontAwesomeIcons.twitter, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(linkedin_url, FontAwesomeIcons.linkedin, context),
            const SizedBox(
              height: 30,
            ),


            ListTile(
              leading: Transform.translate(
                offset: Offset(65, 0), // Adjust the offset to move the icon to the right
                child: Icon(Icons.location_on),
              ),
              onTap: () {
                _openLocationInApp(context, 34.823154, 10.680271);
              },
            ),
            Container(
              height: 100,
              width: 2,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}


_openLocationInApp(
    BuildContext context, double latitude, double longitude) {
  MapsLauncher.launchCoordinates(latitude, longitude);
}
//this section for show social icon in left of homepage