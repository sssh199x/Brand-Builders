import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';
import 'all_orders.dart';
import 'order_view.dart';

class PreviousOrders extends StatelessWidget {
  const PreviousOrders({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sliderWidth;
    if (screenWidth > 420) {
      sliderWidth = 420;
    } else {
      sliderWidth = screenWidth;
    }

    final sliderHeight = sliderWidth * (9 / 16) + 60;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: SectionHeader(
            headerText: 'Your Previous Orders',
            viewText: 'View All  >',
            viewWidth: MediaQuery.of(context).size.width * 0.2,
            onViewClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const AllOrders()),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: sliderHeight,
          child: Consumer<FoodModel>(builder: (context, value, child) {
            int count = value.foodItems.length;
            return CarouselSlider.builder(
                itemCount: count > 4 ? 4 : count,
                itemBuilder: (context, index, realIdx) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OrderView(
                      orderItem: value.foodItems[index],
                      sliderHeight: sliderHeight - 10,
                      sliderWidth: sliderWidth,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: sliderHeight ,
                  aspectRatio: 16 / 9,
                  viewportFraction: sliderWidth * 0.92 / screenWidth,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ));
          }),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
