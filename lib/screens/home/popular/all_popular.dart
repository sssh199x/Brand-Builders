import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/home/popular/popular_view.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';

class PopularAll extends StatelessWidget {
  const PopularAll({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    double aspectRatio = 9 / 16;
    double extraHeight = 50;
    double reduceHeight = 200;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Popular'),
          backgroundColor: prmColor,
          foregroundColor: bgColor),
      body: Consumer<RestaurantModel>(
        builder: (context, value, child) {
          return orientation == Orientation.portrait
              ? ListView.builder(
                  itemCount: value.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RestaurantView(
                        restaurant: value.restaurants[index],
                        sliderHeight: screenWidth * aspectRatio + extraHeight,
                        sliderWidth: screenWidth,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: value.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RestaurantView(
                        restaurant: value.restaurants[index],
                        sliderHeight: screenWidth * aspectRatio - reduceHeight,
                        sliderWidth: screenWidth,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
