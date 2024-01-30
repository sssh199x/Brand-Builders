import 'package:flutter/material.dart';
import 'package:ordering_app/provider/filter_options.dart';
import 'provider/location.dart';
import 'provider/restaurant_model.dart';
import 'provider/food_model.dart';
import 'package:provider/provider.dart';
import 'bottom_nav.dart';
import 'res/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print('App Initialized Before Starting The runApp()');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Set the status bar color using TStatusBarColor class
    TStatusBarColor.setStatusBarColor(context, prmColor);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodModel()),
        ChangeNotifierProvider(create: (_) => RestaurantModel()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(
          create: (_) => FilterOptions(),
        )
      ],
      child: MaterialApp(
        title: 'Ordering App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: prmColor,
          primarySwatch: Colors.green,
          fontFamily: 'Inter',
          textTheme: Theme.of(context).textTheme.apply(bodyColor: txtColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) {
          final scale = MediaQuery.of(context)
              .textScaler
              .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.0);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: scale),
              child: child!);
        },
        home: const BottomNavigation(),
      ),
    );
  }
}
