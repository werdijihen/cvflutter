import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Page'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Make a Phone Call'),
              onTap: () {
                _makePhoneCall('+216 22158003');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Send an Email'),
              onTap: () {
                _sendEmail('malekayadi01@gmail.com');
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Open Location in App'),
              onTap: () {
                _openLocationInApp(
                    context,34.533680, 10.506570); // Pass the context
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to make a phone call
  _makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to send an email
  _sendEmail(String emailAddress) async {
    String url = 'mailto:$emailAddress?subject=Subject%20of%20the%20email';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  // Function to open the location in a map app using maps_launcher
  _openLocationInApp(
      BuildContext context, double latitude, double longitude) {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }
}