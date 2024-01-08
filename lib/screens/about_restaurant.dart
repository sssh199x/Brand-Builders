import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';

class AboutRestaurant extends StatelessWidget {
  const AboutRestaurant({super.key, required this.restaurant});

  final Restaurant restaurant;

  Widget _buildPortraitStack(
      double screenWidth, BuildContext context, double paddingSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: screenWidth - 160,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(restaurant.image), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: screenWidth / 2.1694, //180,
            child: Align(
              child: SizedBox(
                width: screenWidth / 5.1428, //i.e 80
                height: screenWidth / 5.1428,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(restaurant.image),
                          fit: BoxFit.cover)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            left: 10,
            child: Align(
              child: SizedBox(
                width: screenWidth / 10.2857, // 40
                height: screenWidth / 10.2857,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
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
                width: screenWidth / 10.2857, // 40
                height: screenWidth / 10.2857,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildLandscapeStack(
      double screenWidth, BuildContext context, double paddingSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: screenWidth - 720,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(restaurant.image), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: screenWidth / 9.7733, //87,
            child: Align(
              child: SizedBox(
                width: screenWidth / 13.7142, //i.e 62
                height: screenWidth / 13.71425,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(restaurant.image),
                          fit: BoxFit.cover)),
                ),
              ),
            )),
        Positioned(
          top: 10,
          left: 10,
          child: Align(
            child: SizedBox(
              width: screenWidth / 24.2938, //35
              height: screenWidth / 24.2938,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    iconSize: 15,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Align(
            child: SizedBox(
              width: screenWidth / 24.2938, //35
              height: screenWidth / 24.2938,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    iconSize: 15,
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            //color: Colors.amber,
            width: double.infinity,
            height: orientation == Orientation.portrait
                ? screenWidth - 140
                : screenWidth - 700,
            child: orientation == Orientation.portrait
                ? _buildPortraitStack(screenWidth, context, paddingSize)
                : _buildLandscapeStack(screenWidth, context, paddingSize),
          ),
          Container(
            alignment: Alignment.centerLeft,
            //width: double.infinity,
            margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
            // color: Colors.red,
            child: FittedBox(
              child: Text(restaurant.name, style: titleStyle),
            ),
          ),
          Container(
            //width: double.infinity,
            margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: starColor,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: restaurant.rating.toString(), style: txtStyle2),
                      TextSpan(
                          text: '(${restaurant.reviews})|', style: txtStyle2),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.amber,

                    // width: orientation == Orientation.portrait ? 25:15,
                    height: 20,
                    child: Marquee(
                      startAfter: const Duration(seconds: 2),
                      text: restaurant.description,
                      style: txtStyle2,
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 5.0,
                      velocity: 50.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ),
                Text('|${restaurant.distance.toString()}km away',
                    style: txtStyle2),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: prmColor,
                    size: 20,
                    shadows: [Shadow(color: prmColor, offset: Offset(10, 0))],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
