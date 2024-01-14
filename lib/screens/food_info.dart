import 'package:flutter/material.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:ordering_app/screens/portrait_landscape_stack.dart';
import 'package:provider/provider.dart';
import 'about_restaurant.dart';

class FoodInfo extends StatelessWidget {
  final AboutRestaurant restaurant;
  const FoodInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(body: Consumer<FoodModel>(
      builder: (context, value, child) {
        return orientation == Orientation.portrait
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    width: double.infinity,
                    height: screenWidth - 140,
                    child: PortraitLandscapeStack(
                        widget: restaurant,
                        screenWidth: screenWidth,
                        context: context,
                        paddingSize: paddingSize,
                        orientation: orientation,
                        includeAvatar: false),
                  )
                ],
              )
            : const Column();
      },
    ));
  }
}
