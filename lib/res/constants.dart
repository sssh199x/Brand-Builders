import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const prmColor = Color(0xFF37BD6B);
const txtColor = Colors.black;
const starColor = Color(0xFFFFCC00);
const bgColor = Colors.white;
const containerColor = Color(0xFFD9D9D9);

//keys for shared preferences

//for address
const addStyle =
    TextStyle(fontSize: 14, fontFamily: 'Inter', color: Colors.white);

//each category header
const headerStyle = TextStyle(
    fontSize: 17,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: txtColor);

const viewStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    letterSpacing: 0.5,
    color: prmColor);

//for each dish or restaurant name
const titleStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: txtColor);
//for Restaurant Info
const infoStyle = TextStyle(
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: txtColor);
//for Restaurant Info Text
const infoStyleText = TextStyle(
    fontSize: 13,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: txtColor);

//for rating and reviews
const txtStyle1 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: txtColor);

const txtStyle2 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Color(0xFF828282));

class TStatusBarColor {
  static Future<void> setStatusBarColor(
      BuildContext context, Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );

    // Check if the platform is iOS
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Set status bar style for iOS
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: prmColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    }
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
