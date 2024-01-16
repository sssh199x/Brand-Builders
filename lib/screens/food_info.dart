import 'package:flutter/material.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key, required this.foods});
  final Food foods;
  Widget _buildPortraitStackForFoodInfo(
      BuildContext context, Orientation orientation, double screenWidth) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: orientation == Orientation.portrait
                  ? screenWidth - 160
                  : screenWidth - 720,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(foods.image),
                      // includeAvatar ? AssetImage(widget.restaurant.foodimageforrestro) : AssetImage(food.foodItems.first.image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: Align(
              child: SizedBox(
                width: orientation == Orientation.portrait
                    ? screenWidth / 10.2857
                    : screenWidth / 24.2938, // 40 : 35
                height: orientation == Orientation.portrait
                    ? screenWidth / 10.2857
                    : screenWidth / 24.2938,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize:
                          orientation == Orientation.portrait ? 24.0 : 15.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 10,
            child: Align(
              child: SizedBox(
                width: orientation == Orientation.portrait
                    ? screenWidth / 10.2857
                    : screenWidth / 24.2938, // 40 : 35
                height: orientation == Orientation.portrait
                    ? screenWidth / 10.2857
                    : screenWidth / 24.2938,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize:
                          orientation == Orientation.portrait ? 24.0 : 15.0,
                      onPressed: () {},
                      icon: const Icon(Icons.search)),
                ),
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(body: Consumer<FoodModel>(
      builder: (context, value, child) {
        return orientation == Orientation.portrait
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    width: double.infinity,
                    height: screenWidth - 140,
                    child: _buildPortraitStackForFoodInfo(
                        context, orientation, screenWidth),
                  )
                ],
              )
            : const Column();
      },
    ));
  }
}
