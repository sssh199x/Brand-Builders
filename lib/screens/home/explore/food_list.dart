import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/food_item.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';

class DropDownCategory extends StatelessWidget {
  const DropDownCategory({super.key, required this.isExploreAll});

  final bool isExploreAll;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodModel>(
      builder: (context, foodItemsProvider, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.only(left: 3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isExploreAll ? Colors.white : prmColor,
              width: 2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              value: foodItemsProvider.filter, // The value of the currently selected [DropdownMenuItem].
              isDense: true,
              buttonStyleData: const ButtonStyleData(
                height: 30,
              ),
              iconStyleData: IconStyleData(
                  iconEnabledColor: isExploreAll ? Colors.white : Colors.black),
              dropdownStyleData: DropdownStyleData(
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isExploreAll ? prmColor : Colors.white),
              ),
              // The map function is applied to each element of the list.
              // It transforms each string value in the list into a DropdownMenuItem<String>.
              // The <DropdownMenuItem<String>> indicates the type of the result of the mapping operation.
              // For each string value in the original list, a DropdownMenuItem is created.
              // This widget represents an item within a dropdown list.
              // The value property is set to the string value, and the child property is set to a Text widget that displays the same string.
              // Finally, the result of the map operation is converted back into a list. The entire expression produces a list of DropdownMenuItem<String> widgets, each representing one of the original string values with specific styling.
              items: <String>['All', 'Veg', 'N-Veg']
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: isExploreAll
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ))
                  .toList(),
              onChanged: (String? value) {
                foodItemsProvider.setFilter(value!);
              },
            ),
          ),
        );
      },
    );
  }
}

class ListViewBuild extends StatelessWidget {
  const ListViewBuild({super.key, required this.viewAll});

  final bool viewAll;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodModel>(builder: (context, value, child) {
      int count = value.foodItems.length;
      int itemCount = viewAll
            ? count
            : count > 6
                ? 6
                : count;
      return ListView.builder(
        padding: EdgeInsets.zero,
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          Food item = value.foodItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodItem(foodItem: item)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 121,
                    height: 94,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(item.restaurant,
                            style: const TextStyle(
                                fontFamily: 'Inter', fontSize: 13,fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text(
                          'Rs ${item.price.toString()}',
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: starColor,
                              size: 15,
                            ),
                            const SizedBox(width: 7),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: item.rating.toString(),
                                    style: txtStyle1,
                                  ),
                                  TextSpan(
                                    text: ' (${item.reviews.toString()})',
                                    style: txtStyle2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(Icons.location_on, size: 12),
                            const SizedBox(width: 7),
                            Text(
                              '${item.distance.toString()} km',
                              style: txtStyle2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

class GridViewBuild extends StatelessWidget {
  const GridViewBuild({super.key});

    Widget _gridItemWidget(Food item, BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodItem(foodItem: item)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 102,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 4),
                  Text(item.restaurant,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 4),
                  Text(
                    'Rs ${item.price}',
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: starColor, size: 15),
                      const SizedBox(width: 7),
                      Text(item.rating.toString(), style: txtStyle1),
                      Text(' (${item.reviews.toString()})', style: txtStyle2),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12),
                      const SizedBox(width: 7),
                      Text('${item.distance} km', style: txtStyle2),
                    ],
                  )
                ],
              ),
            );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<FoodModel>(builder: (context, value, child) {
      int count = value.foodItems.length;
      bool isWideScreen = MediaQuery.of(context).size.width > 400;
      return GridView.builder(
          gridDelegate: isWideScreen
              ? const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 220,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  maxCrossAxisExtent: 220)
              : const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 220,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
          itemCount: count > 6 ? 6 : count,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Food item = value.foodItems[index];
            return _gridItemWidget(item, context);
          });
    });
  }
}
