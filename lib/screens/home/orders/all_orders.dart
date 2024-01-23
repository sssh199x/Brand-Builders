import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';
import 'order_view.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    double aspectRatio = 9 / 16;
    double extraHeight = 50;
    double reduceHeight = 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prmColor,
        foregroundColor: bgColor,
        title: const Text('Orders'),
      ),
      body: Consumer<FoodModel>(
        builder: (context, value, child) {
          return orientation == Orientation.portrait
              ? ListView.builder(
                  itemCount: value.foodItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: OrderView(
                        orderItem: value.foodItems[index],
                        sliderHeight: screenWidth * aspectRatio + extraHeight,
                        sliderWidth: screenWidth,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: value.foodItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OrderView(
                        orderItem: value.foodItems[index],
                        sliderHeight: screenWidth * aspectRatio - reduceHeight,
                        sliderWidth: screenWidth,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
