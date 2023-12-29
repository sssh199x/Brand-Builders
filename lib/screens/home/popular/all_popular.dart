import 'package:flutter/material.dart';
import 'package:ordering_app/screens/home/popular/popular_view.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';

class PopularAll extends StatelessWidget {
  const PopularAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular')),
      body: Consumer<RestaurantModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.restaurants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: RestaurantView(
                  restaurant: value.restaurants[index],
                  sliderHeight: MediaQuery.of(context).size.width *
                      (9 / 16), // (9/16 = 0.5625, 411.42857 * 0.5625 = 231.428)
                  sliderWidth: MediaQuery.of(context).size.width,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
