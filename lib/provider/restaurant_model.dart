import 'package:flutter/foundation.dart';

class RestaurantModel with ChangeNotifier {
  final restaurants = [
    Restaurant(
      restaurantinfo:
          'Serves meat, vegan options available. Creperie and eatery that offers a few vegan crepe options.',
      name: 'French Crepie',
      description:
          'French, Cafe, European, Healthy, Vegetarian Friendly, Vegan Options',
      image: 'assets/frenchcrepie.jpg',
      foodimage: 'assets/frenchcrepiefood1.jpeg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
      location: 'Khahare Chowk, Lakeside',
      contactno: '980-6667705',
    ),
    Restaurant(
      restaurantinfo:
          'The greatest pizza in town, with a huge selection of toppings.',
      name: 'Godfathers Pizzeria Pvt.Ltd.',
      description:
          'Healthy and Hygienic fire wood pizza with the traditional wood fire oven.',
      image: 'assets/godfather.jpg',
      foodimage: 'assets/pizza.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
      location: 'Lakeside Rd, Hallan Chowk 18th street',
      contactno: '061-466501',
    ),
    Restaurant(
      restaurantinfo:
          'Flawless dining experience,consistency providing exceptional food & superlative service',
      name: 'Byanjan',
      description: 'Local cuisine, Indian, Contemporary, Nepali, International',
      image: 'assets/bhajyan.jpg',
      foodimage: 'assets/byanjanfood.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
      location: 'Lakeside Rd 15, Pokhara',
      contactno: '061-456271',
    ),
    Restaurant(
      restaurantinfo: 'Cool vibe. Perfect ambience. Delicious food.',
      name: 'Roadhouse Cafe',
      description: 'Italian, Bar, Pizza, European, Diner, Vegetarian Friendly',
      image: 'assets/roadhouse.jpg',
      foodimage: 'assets/roadhousefood.jpg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24, location: 'Hallan chowk ,Lakeside', contactno: '061-457421',
      // momos: ['Chicken Momo','Veg Momo'],
      // fooddescription: ['Chicken,Soup & Flour','Smashed Vegetables,Soup & Flour'],
      // foodprice: ['450','350'],
    ),
    Restaurant(
      restaurantinfo:
          'Serves meat, vegan options available. Creperie and eatery that offers a few vegan crepe options.',
      name: 'French Crepie',
      description:
          'French, Cafe, European, Healthy, Vegetarian Friendly, Vegan Options',
      image: 'assets/frenchcrepie.jpg',
      foodimage: 'assets/frenchcrepiefood1.jpeg',
      rating: 4.5,
      reviews: 232,
      distance: 1.3,
      time: 24,
      location: 'Khahare Chowk, Lakeside',
      contactno: '980-6667705',
    ),
  ];
}

class Restaurant {
  final String name,
      image,
      description,
      restaurantinfo,
      foodimage,
      location,
      contactno;
  final double rating, distance;
  final int reviews, time;
  //final List momos,fooddescription,foodprice;

  Restaurant({
    // required this.momos,
    // required this.fooddescription,
    // required this.foodprice,
    required this.contactno,
    required this.location,
    required this.foodimage,
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
