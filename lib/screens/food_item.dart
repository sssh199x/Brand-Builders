import 'package:flutter/material.dart';
import 'package:ordering_app/provider/food_model.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: Center(
          child: Image.asset(
        foodItem.image,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
      )),
    );
  }
}
