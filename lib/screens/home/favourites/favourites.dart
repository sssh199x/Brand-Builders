import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';
import 'all_favourites.dart';
import 'favourite_view.dart';

class FavouriteRestaurants extends StatelessWidget {
  const FavouriteRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scrWidth * 0.04),
      child: Column(
        children: [
          SectionHeader(
              headerText: 'Your Favourite Restaurants',
              viewText: 'View All  >',
              viewWidth: MediaQuery.of(context).size.width * 0.2,
              onViewClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const AllFavourites()
                    ),
                  ),
                );
              }),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            height:  scrWidth < 420 ? scrWidth/ 1.8701 :  scrWidth / 3.5,
            child: Consumer<RestaurantModel>(builder: (context, value, child) {
              int count = value.restaurants.length;
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: count > 6 ? 6 : count,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FavouriteView(favItem: value.restaurants[index]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
