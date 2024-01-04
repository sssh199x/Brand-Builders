import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/about_restaurant.dart';
import 'package:ordering_app/provider/restaurant_model.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView(
      {super.key,
      required this.restaurant,
      required this.sliderHeight,
      required this.sliderWidth});

  final Restaurant restaurant;
  final double sliderHeight;
  final double sliderWidth;

  Widget _buildRestaurantInfo() {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: starColor, size: 15),
          const SizedBox(width: 6),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: restaurant.rating.toString(),
                  style: txtStyle1,
                ),
                TextSpan(
                  text: ' (${restaurant.reviews.toString()})',
                  style: txtStyle2,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          const Icon(Icons.location_on, size: 12),
          const SizedBox(width: 6),
          Text(
            '${restaurant.distance} km',
            style: txtStyle2,
          ),
          const SizedBox(width: 15),
          const Icon(Icons.access_time_filled, size: 12),
          const SizedBox(width: 6),
          Text(
            '${restaurant.time.toString()} mins',
            style: txtStyle2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(MediaQuery.of(context).size.width); // 411.42857
        print(MediaQuery.of(context).size.height); // 867.42857
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    AboutRestaurant(restaurant: restaurant))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            height: sliderHeight - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                restaurant.image,
                width: sliderWidth,
                height: sliderHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildRestaurantInfo(),
        ],
      ),
    );
  }
}
