import 'package:flutter/foundation.dart';

class FoodModel with ChangeNotifier {
  final _foodItems = [
    Food(
        categoryIndex: 0,
        name: 'Chicken Steam Momo',
        restaurant: 'Byanjan',
        image: 'assets/chickenmomo.jpg',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 350,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: false),
    Food(
        categoryIndex: 1,
        name: 'Margherita Pizza',
        restaurant: 'Godfathers Pizzeria Pvt.Ltd.',
        image: 'assets/pizza.jpg',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 700,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: false),
    Food(
        categoryIndex: 3,
        name: 'Veg Wrap',
        restaurant: 'French Crepie',
        image: 'assets/vegwrap.jpg',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 240,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: true),
    Food(
        categoryIndex: 0,
        name: 'Veg Steam Momo',
        restaurant: 'Byanjan',
        image: 'assets/chickenmomo.jpg',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 300,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: true),
    Food(
        categoryIndex: 3,
        name: 'Roadhouse Special Pasta',
        restaurant: 'Roadhouse Cafe',
        image: 'assets/pasta.jpg',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 395,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: true),
    Food(
        categoryIndex: 2,
        name: 'Chowmein',
        restaurant: 'Roadhouse Cafe',
        image: 'assets/chowmein.webp',
        rating: 4.5,
        reviews: 232,
        distance: 1.3,
        price: 395,
        description:
            "Pizza is an Italian food that was created in Italy (The Naples area). It is made with different toppings. Some of the most common toppings are cheese, sausages, pepperoni, vegetables, tomatoes, spices and herbs and basil. These toppings are added over a piece of bread covered with sauce. The sauce is most often tomato-based, but butter-based sauces are used, too. The piece of bread is usually called a 'pizza crust'. Almost any kind of topping can be put over a pizza. The toppings used are different in different parts of the world. Pizza comes from Italy from Neapolitan cuisine. However, it has become popular in many parts of the world.",
        isVeg: false)
  ];

  String _filter = 'All';

  List<Food> get foodItems {
    if (_filter == 'All') {
      return _foodItems;
    } else if (_filter == 'Veg') {
      return _foodItems.where((foodItem) => foodItem.isVeg).toList();
    } else if (_filter == 'N-Veg') {
      return _foodItems.where((foodItem) => !foodItem.isVeg).toList();
    }
    return _foodItems;
  }

  String get filter => _filter;

  void setFilter(String filterValue) {
    _filter = filterValue;
    notifyListeners();
  }

  final _exploreItems = [
    'Near you',
    'Spaghheti',
    'Biryani',
    'Seafood',
    'Bakery'
  ];

  List<String> get exploreItems => _exploreItems;

  int _selectedItem = 0;

  int get selectedItem => _selectedItem;

  void setSelectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}

class Food {
  final String name, restaurant, image, description;
  final double rating, distance, price;
  final int reviews;
  final bool isVeg;
  final int categoryIndex;

  Food(
      {required this.description,
      required this.categoryIndex,
      required this.name,
      required this.restaurant,
      required this.image,
      required this.rating,
      required this.reviews,
      required this.distance,
      required this.price,
      required this.isVeg});
}
