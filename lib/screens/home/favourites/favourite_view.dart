import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/about_restaurant.dart';
import 'package:ordering_app/provider/restaurant_model.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({
    super.key,
    required this.favItem,
    required this.sliderWidth,
    required this.sliderHeight,
  });

  final Restaurant favItem;
  final double sliderWidth;
  final double sliderHeight;

  Widget _buildImageContainer() {
    return SizedBox(
      width: sliderWidth,
      height: sliderHeight - 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(favItem.image, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(favItem.name, style: titleStyle),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget _buildRatingAndDistance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.star, color: starColor, size: 15),
        const SizedBox(width: 6),
        Text(favItem.rating.toString(), style: txtStyle1),
        Text(' (${favItem.reviews.toString()})', style: txtStyle2),
        const SizedBox(width: 15),
        const Icon(Icons.location_on, size: 12),
        const SizedBox(width: 6),
        Text('${favItem.distance.toString()} km', style: txtStyle2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutRestaurant(restaurant: favItem),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageContainer(),
          _buildTitle(),
          _buildRatingAndDistance(),
        ],
      ),
    );
  }
}
