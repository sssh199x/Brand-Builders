import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:provider/provider.dart';

import 'favourite_view.dart';

class AllFavourites extends StatelessWidget {
  const AllFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),backgroundColor: prmColor,foregroundColor: bgColor,
        ),
        body: Consumer<RestaurantModel>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavouriteView(
                    favItem: value.restaurants[index],
                    sliderWidth: double.infinity,
                    sliderHeight: MediaQuery.of(context).size.width * (9 / 16),
                    
                  ),
                );
              });
        }));
  }
}
