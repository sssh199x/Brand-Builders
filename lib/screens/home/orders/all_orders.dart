import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';
import 'order_view.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prmColor,
        foregroundColor: bgColor,
        title: const Text('Orders'),
      ),
      body: Consumer<FoodModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.foodItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OrderView(
                  orderItem: value.foodItems[index],
                  sliderHeight: MediaQuery.of(context).size.width * (9 / 16) + 50 ,
                  sliderWidth: double.infinity,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
