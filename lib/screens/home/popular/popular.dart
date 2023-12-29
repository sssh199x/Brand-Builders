import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/screens/home/popular/all_popular.dart';
import 'package:ordering_app/screens/home/popular/popular_view.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';

class PopularRestaurants extends StatelessWidget {
  const PopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04), // 16.4571
          child: SectionHeader(
            headerText: 'Popular In Your Area',
            viewText: 'See More  >',
            viewWidth: MediaQuery.of(context).size.width *
                0.2, // 0.196 i.e (80.6399 and overflow nahuna greater than 81 huna parxa so 0.2(82.2857) ) ma overflow janxa (Previously 87 thyo )
            onViewClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PopularAll()),
                ),
              );
            },
          ),
        ),
        const PopularRestSlider(),
        Divider(
          thickness: 2.0,
          color: const Color(0xFFF3F3F3).withOpacity(0.8),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class PopularRestSlider extends StatelessWidget {
  const PopularRestSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sliderWidth;
    if (screenWidth > 420) {
      sliderWidth = 420;
    } else {
      sliderWidth = screenWidth;
    }

    double sliderHeight =
        sliderWidth * (9 / 16) + 40; // (231.428 + 30 = 261.428) (30 at first)

    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 5),
      height: sliderHeight,
      child: Consumer<RestaurantModel>(
        builder: (context, value, child) {
          int count = value.restaurants.length;
          return CarouselSlider.builder(
            itemCount: count > 4 ? 4 : count,
            itemBuilder: (context, index, realIdx) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RestaurantView(
                  sliderHeight: sliderHeight - 10,
                  restaurant: value.restaurants[index],
                  sliderWidth: sliderWidth,
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: sliderWidth * 0.92 / screenWidth,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              height: sliderHeight,
              disableCenter: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          );
        },
      ),
    );
  }
}
