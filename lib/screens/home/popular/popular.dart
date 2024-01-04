import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/screens/home/popular/all_popular.dart';
import 'package:ordering_app/screens/home/popular/popular_view.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../section_header.dart';

class PopularRestaurants extends StatelessWidget {
  // When you use super.key, you're explicitly passing the key to the superclass (the StatelessWidget constructor). This syntax is useful when you want to forward the key to the superclass without modifications.
  // When you use Key? key directly in the constructor parameters, you're declaring a nullable Key named key. This gives you flexibility in how you handle the key within the widget.
  // In practice, both methods achieve the same result. However, using Key? key directly in the constructor parameters is more explicit and may be considered a cleaner approach. It's a matter of personal preference and coding style.

  //const PopularRestaurants({super.key});
  const PopularRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 16.4571
          child: SectionHeader(
            key: UniqueKey(),
            headerText: 'Popular In Your Area',
            viewText: 'See More  >',
            viewWidth: screenWidth *
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
        _buildPopularRestSlider(context),
        Divider(
          thickness: 2.0,
          color: const Color(0xFFF3F3F3).withOpacity(0.8),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
// In your case, the PopularRestSlider widget is not too large, and it doesn't seem to have complex logic or state. Therefore, separating it into a function within the same file (PopularRestaurants) may be a reasonable choice. If the widget grows in complexity or if you find yourself reusing it in different parts of your application, you might consider creating a separate class for it. So i will be commenting this code and make a function  which provides the same implementation

// class PopularRestSlider extends StatelessWidget {
//   const PopularRestSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double sliderWidth;
//     if (screenWidth > 420) {
//       sliderWidth = 420;
//     } else {
//       sliderWidth = screenWidth;
//     }

//     double sliderHeight =
//         sliderWidth * (9 / 16) + 40; // (231.428 + 30 = 261.428) (30 at first)

//     return Container(
//       margin: const EdgeInsets.only(top: 14, bottom: 5),
//       height: sliderHeight,
//       child: Consumer<RestaurantModel>(
//         builder: (context, value, child) {
//           int count = value.restaurants.length;
//           return CarouselSlider.builder(
//             itemCount: count > 4 ? 4 : count,
//             itemBuilder: (context, index, realIdx) {
//               return Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: RestaurantView(
//                   sliderHeight: sliderHeight - 10,
//                   restaurant: value.restaurants[index],
//                   sliderWidth: sliderWidth,
//                 ),
//               );
//             },
//             options: CarouselOptions(
//               aspectRatio: 16 / 9,
//               viewportFraction: sliderWidth * 0.92 / screenWidth,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               autoPlay: true,
//               height: sliderHeight,
//               disableCenter: true,
//               autoPlayInterval: const Duration(seconds: 5),
//               autoPlayAnimationDuration: const Duration(milliseconds: 2000),
//               autoPlayCurve: Curves.fastOutSlowIn,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
double calculateSliderHeight(double screenWidth) {
  double aspectRatio = 9 / 16;
  double extraHeight = 40;
  return screenWidth * aspectRatio + extraHeight;
}

Widget _buildPopularRestSlider(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double sliderWidth = screenWidth > 420 ? 420 : screenWidth;
  double sliderHeight = calculateSliderHeight(screenWidth);

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
