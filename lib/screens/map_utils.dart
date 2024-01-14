import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  // Static Function : A  method that defines as a member of an object but is accesible directly from an API objects constructor,rather than from a object instance created via the constructor.
  static Future<void> openMap(
      double latitude, double longitude, BuildContext context) async {
    final String googleMapUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final parsedUri = Uri.parse(googleMapUrl);
    try {
      //On recent versions of ANDROID & IOS, this will always return false unless the application has been configured to allow querying the system for launch support.
      // ANDROID (As mentioned in url_launcher package documentation) : Add any URL schemes passed to canLaunchUrl as <queries> entries in your AndroidManifest.xml, otherwise it will return false in most cases starting on Android 11 (API 30) or higher. Checking for supportsLaunchMode(LaunchMode.inAppBrowserView) also requires a <queries> entry to return anything but false. A <queries> element must be added to your manifest as a child of the root element.
      // IOS : Add any URL schemes passed to canLaunchUrl as LSApplicationQueriesSchemes entries in your Info.plist file, otherwise it will return false.
      if (await canLaunchUrl(parsedUri)) {
        await launchUrl(parsedUri,
            mode: LaunchMode.inAppBrowserView,
            // To open google map url in new tab i.e _blank
            webOnlyWindowName: '');
      } else {
        // To see this working comment added queries in android manidfest file, so that it cant open the url and snackbar is shown instead.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
                "Couldn't open Google Maps,check if it is installed in your device or not."),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () async {
                print('Retrying to open the Google Maps');
                if (await canLaunchUrl(parsedUri)) {
                  await launchUrl(parsedUri,
                      mode: LaunchMode.inAppBrowserView,
                      // To open google map url in new tab i.e _blank
                      webOnlyWindowName: '');
                }
              },
            ),
          ),
        );
      }
    } catch (e) {
      print('Error opening the map: $e');
      throw 'Could not open the Map';
    }
  }

  static Future<void> openDialPad(
      String contactno, BuildContext context) async {
    final Uri callLauncherUri = Uri(
      scheme: 'tel',
      path: contactno,
    );
    try {
      if (await canLaunchUrl(callLauncherUri)) {
        await launchUrl(callLauncherUri);
      } else {
        // To see this working change tel to tep so that it cant open the url and snackbar is shown instead.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Couldn't open Dialpad"),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () async {
                print('Retrying to open the dialpad');
                if (await canLaunchUrl(callLauncherUri)) {
                  await launchUrl(callLauncherUri);
                }
              },
            ),
          ),
        );
      }
    } catch (e) {
      print('Error opening the dialpad: $e');
      throw 'Could not open the Dialpad';
    }
  }
}
