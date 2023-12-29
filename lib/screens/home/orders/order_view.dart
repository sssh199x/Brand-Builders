import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/food_item.dart';
import 'package:ordering_app/provider/food_model.dart';

class OrderView extends StatelessWidget {
  const OrderView(
      {super.key,
      required this.orderItem,
      required this.sliderHeight,
      required this.sliderWidth});

  final Food orderItem;
  final double sliderWidth;
  final double sliderHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => FoodItem(foodItem: orderItem))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: sliderWidth,
              height: sliderHeight - 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(orderItem.image, fit: BoxFit.cover),
              )),
          Text(orderItem.name, style: titleStyle),
          const SizedBox(height: 8),
          Text(
            orderItem.restaurant,
            style: const TextStyle(fontSize: 14, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.star, color: starColor, size: 15),
              const SizedBox(width: 6),
              Text(orderItem.rating.toString(), style: txtStyle1),
              Text('(${orderItem.reviews.toString()})', style: txtStyle2),
              const SizedBox(width: 15),
              const Icon(Icons.location_on, size: 12),
              const SizedBox(width: 6),
              Text('${orderItem.distance.toString()} km', style: txtStyle2),
            ],
          ),
        ],
      ),
    );
  }
}
