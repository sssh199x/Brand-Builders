import 'dart:io';

import 'package:flutter/material.dart';

class FilterOptions with ChangeNotifier {
  final List<ServiceOption> _serviceOptions = [
    ServiceOption(optionText: 'Delivery', isSelected: false),
    ServiceOption(optionText: 'Appointment', isSelected: false),
    ServiceOption(optionText: 'In-store', isSelected: false),
  ];

  List<ServiceOption> get serviceOptions => _serviceOptions;
  final List<PaymentOption> _paymentOptions = [
    PaymentOption(optionText: 'Cash', isSelected: false),
    PaymentOption(optionText: 'Credit Cards', isSelected: false),
    PaymentOption(optionText: 'Digital Payment', isSelected: false)
  ];
  List<PaymentOption> get paymentOptions => _paymentOptions;
  final List<AccesibilityFeature> _accesibilityFeatures = [
    AccesibilityFeature(optionText: 'Wheelchair', isSelected: false),
    AccesibilityFeature(optionText: 'Parking', isSelected: false),
    AccesibilityFeature(optionText: 'Allows Pets', isSelected: false)
  ];
  List<AccesibilityFeature> get accesibilityFeatures => _accesibilityFeatures;
  final List<HostLanguage> _hostLanguages = [
    HostLanguage(optionText: 'Nepali', isSelected: false),
    HostLanguage(optionText: 'English', isSelected: false),
    HostLanguage(optionText: 'Others', isSelected: false)
  ];
  List<HostLanguage> get hostLanguages => _hostLanguages;
  // Function to reset all boolean values to false
  void clearAllValues() {
    for (var element in _paymentOptions) {
      element.isSelected = false;
    }

    for (var element in _accesibilityFeatures) {
      element.isSelected = false;
    }

    for (var element in _hostLanguages) {
      element.isSelected = false;
    }

    for (var element in _serviceOptions) {
      element.isSelected = false;
    }

    // Add similar logic for other lists

    _selectedItem = 0;
    _selectedItemHours = 0;
    _currentRangeValues = const RangeValues(500, 1200);

    notifyListeners();
  }

  // Function to determine the BorderRadius based on the platform
  BorderRadius getBorderRadius() {
    if (Platform.isAndroid) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      );
    } else {
      // For iOS or other platforms, return no BorderRadius
      return BorderRadius.zero;
    }
  }

  double getContainerHeight() {
    if (Platform.isAndroid) {
      return 57.0;
    } else {
      return 70.0;
    }
  }

  void toggleSwitch(int index, bool newValue) {
    _serviceOptions[index].isSelected = newValue;
    notifyListeners();
  }

  void toggleCheckbox(int index, bool newValue) {
    _hostLanguages[index].isSelected = newValue;
    notifyListeners();
  }

  final _listOfPlaces = ['Anytype', 'In site', 'Deliver'];
  List<String> get listOfPlaces => _listOfPlaces;
  final List<String> _operatingHours = ['Open Now', 'Specific Hours'];
  List<String> get operatingHours => _operatingHours;

  int _selectedItem = 0;
  int get selectedItem => _selectedItem;

  void setSelectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

  int _selectedItemHours = 0;
  int get selectedItemHours => _selectedItemHours;

  void setSelectedItemHours(int index) {
    _selectedItemHours = index;
    notifyListeners();
  }

  RangeValues _currentRangeValues = const RangeValues(500, 1200);
  RangeValues get currentRangeValues => _currentRangeValues;
  void setSelectedRange(RangeValues range) {
    _currentRangeValues = range;
    notifyListeners();
  }
}

class ServiceOption {
  final String optionText;
  bool isSelected;

  ServiceOption({required this.optionText, required this.isSelected});
}

class PaymentOption {
  final String optionText;
  bool isSelected;
  PaymentOption({required this.optionText, required this.isSelected});
}

class AccesibilityFeature {
  final String optionText;
  bool isSelected;
  AccesibilityFeature({required this.optionText, required this.isSelected});
}

class HostLanguage {
  final String optionText;
  bool isSelected;
  HostLanguage({required this.optionText, required this.isSelected});
}
