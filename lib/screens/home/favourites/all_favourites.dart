import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:provider/provider.dart';

import 'favourite_view.dart';

class AllFavourites extends StatelessWidget {
  const AllFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    double aspectRatio = 9 / 16;
    double extraHeight = 50;
    double reduceHeight = 200;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        backgroundColor: prmColor,
        foregroundColor: bgColor,
      ),
      body: Consumer<RestaurantModel>(
        builder: (context, value, child) {
          return orientation == Orientation.portrait
              ? ListView.builder(
                  itemCount: value.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FavouriteView(
                        favItem: value.restaurants[index],
                        sliderWidth: screenWidth,
                        sliderHeight: screenWidth * aspectRatio + extraHeight,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: value.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FavouriteView(
                        favItem: value.restaurants[index],
                        sliderWidth: screenWidth,
                        sliderHeight: screenWidth * aspectRatio - reduceHeight,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
