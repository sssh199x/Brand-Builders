import 'package:flutter/foundation.dart';

class RestaurantModel with ChangeNotifier {
  final restaurants = [
    Restaurant(
      name: 'French Crepie',
      image: 'assets/frenchcrepie.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Godfathers Pizzeria',
      image: 'assets/godfather.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Byanjan',
      image: 'assets/bhajyan.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Roadhouse Cafe',
      image: 'assets/roadhouse.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'French Crepie',
      image: 'assets/frenchcrepie.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
  ];
}

class Restaurant {
  final String name, image;
  final double rating, distance;
  final int reviews, time;

  Restaurant({
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
  });
}
