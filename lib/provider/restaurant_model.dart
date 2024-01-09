import 'package:flutter/foundation.dart';

class RestaurantModel with ChangeNotifier {
  final restaurants = [
    Restaurant(
      restaurantinfo: 'Serves meat, vegan options available. Creperie and eatery that offers a few vegan crepe options.' ,
      name: 'French Crepie',
      description: 'French, Cafe, European, Healthy, Vegetarian Friendly, Vegan Options',
      image: 'assets/frenchcrepie.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      restaurantinfo: 'The greatest pizza in town, with a huge selection of toppings.',
      name: 'Godfathers Pizzeria Pvt.Ltd.',
      description: 'Healthy and Hygienic fire wood pizza with the traditional wood fire oven.',
      image: 'assets/godfather.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      restaurantinfo: 'Flawless dining experience,consistency providing exceptional food & superlative service' ,
      name: 'Byanjan',
      description: 'Local cuisine, Indian, Contemporary, Nepali, International',
      image: 'assets/bhajyan.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      restaurantinfo: 'Cool vibe. Perfect ambience. Delicious food.',
      name: 'Roadhouse Cafe',
      description: 'Italian, Bar, Pizza, European, Diner, Vegetarian Friendly',
      image: 'assets/roadhouse.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
    ),
    Restaurant(
      restaurantinfo: 'Serves meat, vegan options available. Creperie and eatery that offers a few vegan crepe options.',
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
  final String name, image, description,restaurantinfo;
  final double rating, distance;
  final int reviews, time;

  Restaurant( {
    required this.restaurantinfo,
    required this.description,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
  });
}
