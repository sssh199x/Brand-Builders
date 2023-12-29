import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationProvider with ChangeNotifier {
  List<String> _addresses = [];
  List<String> get addresses => _addresses;

  String _address = 'No Location';
  String get address => _address;

  late LatLong _currentPosition;
  LatLong get currentPosition => _currentPosition;

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setAddresses(List<String> addresses) {
    _addresses = addresses;
    notifyListeners();
  }

  void setCurrentPosition(LatLong latLong) {
    _currentPosition = latLong;
    notifyListeners();
  }

  Future<void> getLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          setAddress('No Location Provided');
        } else {
          await getCurrentPosition();
        }
      } else {
        await getCurrentPosition();
      }
      notifyListeners();
    } catch (e) {
      print('Error getting location permission: $e');
      setAddress('No Location Provided');
      notifyListeners();
    }
  }

  // Future<void> getLocationPermission() async {
  //   LocationPermission permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     // print("Permission not given");
  //     LocationPermission permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied ||
  //         permission == LocationPermission.deniedForever) {
  //       setAddress('No Location Provided');

  //       //_address = 'No Location Provided';
  //     } else {
  //       getCurrentPosition();
  //     }
  //   } else {
  //     getCurrentPosition();
  //   }
  //   notifyListeners();
  // }

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setAddress(await getAddress(position.latitude, position.longitude));
      //_address = await getAddress(position.latitude, position.longitude);
      setCurrentPosition(LatLong(position.latitude, position.longitude));
      //_currentPosition = LatLong(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting current position: $e');
      setAddress('No Location Provided');
    }
    notifyListeners();

    //Position position = await Geolocator.getCurrentPosition(
    //desiredAccuracy: LocationAccuracy.best);
    //setAddress(await getAddress(position.latitude, position.longitude));
    //_address = await getAddress(position.latitude, position.longitude);
    //setCurrentPosition(LatLong(position.latitude, position.longitude));
    //_currentPosition = LatLong(position.latitude, position.longitude);
  }

  // Future<String> getAddress(double latitude, double longitude) async {
  //   try {
  //     final apiUrl =
  //         'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

  //     // https://nominatim.openstreetmap.org/reverse?lat=<value>&lon=<value>&<params>

  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       print(data);

  //       String address = data['display_name'];
  //      // print(address);
  //       return address;
  //     } else {
  //       print('Error: ${response.statusCode}');
  //       return 'No Location Provided';
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return 'No Location Provided';
  //   }
  // }

Future<String> getAddress(double latitude, double longitude) async {
  try {
    final apiUrl =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(data);
      // print(data['display_name']);

      // Check if 'display_name' exists and is not null
      if (data != null && data['display_name'] != null) {

        String address = data['display_name'];
        return address;
      } else {
        return 'Invalid API Response';
      }
    } else {
      return 'Failed to get address. Status code: ${response.statusCode}';
    }
  } catch (e) {
    print('Error: $e');
    return 'No Location Provided';
  }
}


}
