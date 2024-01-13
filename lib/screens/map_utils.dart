import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  // Static Function : A  method that defines as a member of an object but is accesible directly from an API objects constructor,rather than from a object instance created via the constructor.
  static Future<void> openMap(double latitude, double longitude) async {
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
      }
    } catch (e) {
      print('Error opening the map: $e');
      throw 'Could not open the Map';
    }
  }
}
