import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';
import 'all_favourites.dart';
import 'favourite_view.dart';

class FavouriteRestaurants extends StatelessWidget {
  const FavouriteRestaurants({super.key});

  Widget _buildSectionHeader(double screenWidth, BuildContext context) {
    return SectionHeader(
        headerText: 'Your Favourite Restaurants',
        viewText: 'View All  >',
        viewWidth: screenWidth * 0.2,
        onViewClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AllFavourites()),
            ),
          );
        });
  }

  Widget _buildFavouriteRestaurantList(
    Orientation orientation,
    double sliderWidth,
    double sliderHeight,
    double screenWidth,
  ) {
    return orientation == Orientation.portrait
        ? Container(
            margin: const EdgeInsets.all(5),
            height: sliderHeight - 110,
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
                    child: FavouriteView(
                      favItem: value.restaurants[index],
                      sliderWidth: sliderWidth,
                      sliderHeight: sliderHeight - 100,
                    ),
                  );
                },
              );
            }),
          )
        : Container(
            margin: const EdgeInsets.all(15),
            height: sliderHeight - 130,
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
                    child: FavouriteView(
                        favItem: value.restaurants[index],
                        sliderWidth: sliderWidth,
                        sliderHeight: sliderHeight - 110),
                  );
                },
              );
            }),
          );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    double sliderWidth = screenWidth > 420
        ? orientation == Orientation.portrait
            ? screenWidth / 1.4333
            : screenWidth / 2.8
        : screenWidth; //(184.5493:300.0069):screenWidth
    double sliderHeight = sliderWidth * (9 / 16) + 60; // 301.875
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: [
          _buildSectionHeader(screenWidth, context),
          const SizedBox(
            height: 10,
          ),
          _buildFavouriteRestaurantList(
              orientation, sliderHeight, sliderWidth, sliderHeight),
        ],
      ),
    );
  }
}
