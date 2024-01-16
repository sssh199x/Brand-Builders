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
  final String name, restaurant, image;
  final double rating, distance, price;
  final int reviews;
  final bool isVeg;
  final int categoryIndex;

  Food(
      {required this.categoryIndex,
      required this.name,
      required this.restaurant,
      required this.image,
      required this.rating,
      required this.reviews,
      required this.distance,
      required this.price,
      required this.isVeg});
}
