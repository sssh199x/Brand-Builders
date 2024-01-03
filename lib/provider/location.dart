import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationProvider with ChangeNotifier {
  List<String> _addressList = [];
  List<String> get addresses => _addressList;

  String _address = 'No Location';
  String get address => _address;

  late LatLong _currentPosition;
  LatLong get currentPosition => _currentPosition;

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setAddresses(List<String> addresses) {
    _addressList = addresses;
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
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setAddress('No Location Provided');
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

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      String newAddress =
          await getAddress(position.latitude, position.longitude);
      setAddress(newAddress);

      setCurrentPosition(LatLong(position.latitude, position.longitude));
    } catch (e) {
      print('Error getting current position: $e');
      setAddress('No Location Provided');
    }
    notifyListeners();
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      final apiUrl =
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return parseAddressResponse(response.body);
      } else {
        return 'Failed to get address. Status code: ${response.statusCode}';
      }
      // When dealing with the API response, it's a good practice to check if the key(display_name) exists before accessing it
    } catch (e) {
      print('Error: $e');
      return 'No Location Provided';
    }
  }

  String parseAddressResponse(String responseBody) {
    try {
      final data = json.decode(responseBody);

      // Check if 'display_name' exists and is not null
      if (data != null && data['display_name'] != null) {
        return data['display_name'];
      } else {
        return 'Invalid API Response';
      }
      // When dealing with the API response, it's a good practice to check if the key exists before accessing it.
    } catch (e) {
      print('Error parsing API response: $e');
      return 'Invalid API Response';
    }
  }
}
