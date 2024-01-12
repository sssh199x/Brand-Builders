import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  // Static Function : A  method that defines as a member of an object but is accesible directly from an API objects constructor,rather than from a object instance created via the constructor.

  static Future<void> openMap(double latitude, double longitude) async {
    final String googleMapUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    try {
      await launchUrl(Uri.parse(googleMapUrl));
    } catch (e) {
      print('Error opening the map: $e');
      throw 'Could not open the Map';
    }
  }
}
