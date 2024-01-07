import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';
import 'all_favourites.dart';
import 'favourite_view.dart';

class FavouriteRestaurants extends StatelessWidget {
  const FavouriteRestaurants({super.key});

  Widget _buildSectionHeader(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return SectionHeader(
        headerText: 'Your Favourite Restaurants',
        viewText: 'View All  >',
        viewWidth: scrWidth * 0.2,
        onViewClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AllFavourites()),
            ),
          );
        });
  }

  Widget _buildFavouriteRestaurantList(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      height: scrWidth < 420 ? scrWidth / 1.8701 : scrWidth / 1.8,
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
                sliderWidth: scrWidth - 170,
                sliderHeight: scrWidth * 9 / 16 - 20,
              ),
            );
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        children: [
          _buildSectionHeader(context),
          const SizedBox(
            height: 10,
          ),
          _buildFavouriteRestaurantList(context),
        ],
      ),
    );
  }
}
