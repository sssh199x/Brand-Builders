import 'package:flutter/foundation.dart';

class RestaurantModel with ChangeNotifier {
  final restaurants = [
    Restaurant(
      name: 'French Crepie',
      description: 'French, Cafe, European, Healthy, Vegetarian Friendly, Vegan Options',
      image: 'assets/frenchcrepie.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Godfathers Pizzeria Pvt.Ltd.',
      description: 'Healthy and Hygienic fire wood pizza with the traditional wood fire oven.',
      image: 'assets/godfather.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Byanjan',
      description: 'Local cuisine, Indian, Contemporary, Nepali, International',
      image: 'assets/bhajyan.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'Roadhouse Cafe',
      description: 'Italian, Bar, Pizza, European, Diner, Vegetarian Friendly',
      image: 'assets/roadhouse.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      name: 'French Crepie',
      description: 'French, Cafe, European, Healthy, Vegetarian Friendly, Vegan Options',
      image: 'assets/frenchcrepie.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
  ];
}

class Restaurant {
  final String name, image, description;
  final double rating, distance;
  final int reviews, time;

  Restaurant({
    required this.description,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
  });
}
