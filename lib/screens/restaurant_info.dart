import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/screens/map_utils.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.restaurant});
  final Restaurant restaurant;

  Widget _buildMapsContainer(BuildContext context, double paddingSize,
      double screenWidth, Orientation orientation) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MapUtils(),
          )),
      child: Container(
        margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
        width: double.infinity,
        height: orientation == Orientation.portrait
            ? screenWidth - 250
            : screenWidth / 6,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Container(
              width: orientation == Orientation.portrait ? 35 : 40,
              height: orientation == Orientation.portrait ? 35 : 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(restaurant.image), fit: BoxFit.cover),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(restaurant.name)),
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                _buildMapsContainer(
                    context, paddingSize, screenWidth, orientation)
              ],
            )
          : Column(
              children: [
                _buildMapsContainer(
                    context, paddingSize, screenWidth, orientation)
              ],
            ),
    );
  }
}
