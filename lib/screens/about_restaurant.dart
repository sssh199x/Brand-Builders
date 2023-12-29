import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';

class AboutRestaurant extends StatelessWidget {
  const AboutRestaurant({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Center(
          child: Image.asset(
        restaurant.image,
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
      )),
    );
  }
}
