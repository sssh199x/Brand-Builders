import 'package:flutter/material.dart';
import 'package:ordering_app/screens/about_restaurant.dart';

class PortraitLandscapeStack extends StatelessWidget {
  const PortraitLandscapeStack({
    super.key,
    required this.widget,
    required this.screenWidth,
    required this.context,
    required this.orientation,
  });

  final AboutRestaurant widget;
  final double screenWidth;
  final BuildContext context;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage(widget.restaurant.foodimageforrestro),
                      // includeAvatar ? AssetImage(widget.restaurant.foodimageforrestro) : AssetImage(food.foodItems.first.image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        // In Dart, an if statement without curly braces {} can be used for a single statement after the if condition.If the if statement or the block inside it contains only one statement, the curly braces can be omitted.
        //if (includeAvatar)
        Positioned(
          left: 10,
          top: orientation == Orientation.portrait
              ? screenWidth / 2.1694
              : screenWidth / 6.1, //180 : 156.6386,
          child: Align(
            child: SizedBox(
              width: orientation == Orientation.portrait
                  ? screenWidth / 5.1428
                  : screenWidth / 13.7142, //i.e 80 : 62
              height: orientation == Orientation.portrait
                  ? screenWidth / 5.1428
                  : screenWidth / 13.71425,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.restaurant.image),
                        fit: BoxFit.cover)),
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
}
