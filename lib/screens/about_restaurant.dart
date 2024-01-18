import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/food_info.dart';
import 'package:ordering_app/screens/portrait_landscape_stack.dart';
import 'package:ordering_app/screens/restaurant_info.dart';

class AboutRestaurant extends StatefulWidget {
  const AboutRestaurant({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<AboutRestaurant> createState() => _AboutRestaurantState();
}

class _AboutRestaurantState extends State<AboutRestaurant>
    with TickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    const Tab(text: 'Momo'),
    const Tab(text: 'Pizza'),
    const Tab(text: 'Chowmein'),
    const Tab(text: 'Snacks'),
    const Tab(text: 'Seafood'),
    const Tab(text: 'Burger'),
  ];
  late final TabController _tabController;
  late final ScrollController _scrollController;
  bool fixedScroll = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: myTabs.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 5;
    });
  }

  Widget _buildCarousel(Orientation orientation, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: double.infinity,
      height: screenWidth - 700,
      child: PortraitLandscapeStack(
          widget: widget,
          screenWidth: screenWidth,
          context: context,
          orientation: orientation),
    );
  }

//
  Widget _buildRestaurantName(double paddingSize) {
    return Container(
      alignment: Alignment.centerLeft,
      //width: double.infinity,
      margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
      // color: Colors.red,
      child: FittedBox(
        child: Text(widget.restaurant.name, style: headerStyle),
      ),
    );
  }

  Widget _buildRestaurantDescription(double paddingSize) {
    Widget buildSlidingDescription() {
      return Expanded(
        child: SizedBox(
          //color: Colors.amber,
          // width: orientation == Orientation.portrait ? 25:15,
          height: 20,
          child: Marquee(
            startAfter: const Duration(seconds: 2),
            text: widget.restaurant.description,
            style: txtStyle2,
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            blankSpace: 5.0,
            velocity: 50.0,
            pauseAfterRound: const Duration(seconds: 1),
            accelerationDuration: const Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: const Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      );
    }

    return Container(
      height: 25,
      margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const FittedBox(
            fit: BoxFit.cover,
            child: Icon(
              Icons.star,
              color: starColor,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: widget.restaurant.rating.toString(),
                    style: txtStyle1),
                TextSpan(
                    text: '(${widget.restaurant.reviews})|', style: txtStyle2),
              ],
            ),
          ),
          buildSlidingDescription(),
          Text('|${widget.restaurant.distance.toString()}km away',
              style: txtStyle2),
          FittedBox(
            fit: BoxFit.cover,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RestaurantInfo(restaurant: widget.restaurant),
                    ));
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: prmColor,
                size: 30,
                shadows: [Shadow(color: prmColor, offset: Offset(10, 0))],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildsWholeRestaurantDescription(
      double paddingSize, double screenWidth, Orientation orientation) {
    return SizedBox(
      height: orientation == Orientation.portrait
          ? screenWidth / 3.3
          : screenWidth / 8,
      width: double.infinity,
      //color: Colors.black12,
      child: Column(
        children: [
          _buildRestaurantName(paddingSize),
          _buildRestaurantDescription(paddingSize),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            //color: Colors.amber,
            margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FittedBox(
                    fit: BoxFit.cover,
                    child: Text('Restaurant Info', style: infoStyle)),
                Text(
                  widget.restaurant.restaurantinfo,
                  style: infoStyleText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: TabBar(
        tabs: const [
          Tab(
            child: Text(
              'Momo',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text('Pizza', style: TextStyle(color: Colors.black)),
          ),
          Tab(
            child: Text('Chowmein', style: TextStyle(color: Colors.black)),
          ),
          Tab(
            child: Text('Snacks', style: TextStyle(color: Colors.black)),
          ),
          Tab(
            child: Text('Seafood', style: TextStyle(color: Colors.black)),
          ),
          Tab(
            child: Text('Burger', style: TextStyle(color: Colors.black)),
          ),
        ],
        isScrollable: true,
        controller: _tabController,
        indicatorColor: prmColor,
        dividerColor: prmColor,
        tabAlignment: TabAlignment.center,
      ),
    );
  }

  Widget _buildPortraitTabBarView(double paddingSize) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: List.generate(_tabController.length, (tabIndex) {
          final selectedRestaurantName = widget.restaurant.name;
          final foodItems = FoodModel()
              .foodItems
              .where((food) =>
                  food.categoryIndex == tabIndex &&
                  food.restaurant == selectedRestaurantName)
              .toList();

          if (foodItems.isEmpty) {
            return SizedBox.shrink(
              child: Padding(
                padding: EdgeInsets.all(paddingSize),
                child: Center(
                  child: Text(
                      "Category of this food isn't available in our restaurant. Please have a look at our other options 😊.",
                      style:
                          infoStyleText.copyWith(fontWeight: FontWeight.w500)),
                ),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
            itemBuilder: (context, index) {
              final food = foodItems[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodInfo(foods: food),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: ListTile(
                    title: Text(food.name),
                    subtitle: const Text('Chicken, Soup'),
                    trailing: const Text('Rs 500'),
                  ),
                ),
              );
            },
            itemCount: FoodModel()
                .foodItems
                .where((food) =>
                    food.categoryIndex == tabIndex &&
                    food.restaurant == selectedRestaurantName)
                .length,
          );
        }),
      ),
    );
  }

  // Widget _buildPortraitTabBarView() {
  //   return Expanded(
  //     child: TabBarView(controller: _tabController, children:
  //     [
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(
  //                       foods: food,
  //                     ),
  //                   ));
  //             },
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text(food.name),
  //                 subtitle: const Text('Chicken,Soup'),
  //                 trailing: const Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(foods: food),
  //                   ));
  //             },
  //             child: const Padding(
  //               padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text('Chicken Momo'),
  //                 subtitle: Text('Chicken,Soup'),
  //                 trailing: Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(foods: food),
  //                   ));
  //             },
  //             child: const Padding(
  //               padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text('Chicken Momo'),
  //                 subtitle: Text('Chicken,Soup'),
  //                 trailing: Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(foods: food),
  //                   ));
  //             },
  //             child: const Padding(
  //               padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text('Chicken Momo'),
  //                 subtitle: Text('Chicken,Soup'),
  //                 trailing: Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(foods: food),
  //                   ));
  //             },
  //             child: const Padding(
  //               padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text('Chicken Momo'),
  //                 subtitle: Text('Chicken,Soup'),
  //                 trailing: Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //       ListView.separated(
  //         separatorBuilder: (context, index) => const Divider(
  //           height: 1,
  //         ),
  //         itemBuilder: (context, index) {
  //           final food = FoodModel().foodItems[index];
  //           return GestureDetector(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FoodInfo(foods: food),
  //                   ));
  //             },
  //             child: const Padding(
  //               padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //               child: ListTile(
  //                 title: Text('Chicken Momo'),
  //                 subtitle: Text('Chicken,Soup'),
  //                 trailing: Text('Rs 500'),
  //               ),
  //             ),
  //           );
  //         },
  //         itemCount: 5,
  //       ),
  //     ]
  //     ),
  //   );
  // }

  Widget _buildLandscapeTabBarView(double paddingSize) {
    return TabBarView(
      controller: _tabController,
      children: List.generate(_tabController.length, (tabIndex) {
        final selectedRestaurantName = widget.restaurant.name;
        final foodItems = FoodModel()
            .foodItems
            .where((food) =>
                food.categoryIndex == tabIndex &&
                food.restaurant == selectedRestaurantName)
            .toList();

        if (foodItems.isEmpty) {
          return SizedBox.shrink(
            child: Padding(
              padding: EdgeInsets.all(paddingSize),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                    "Category of this food isn't available in our restaurant. Please have a look at our other options 😊.",
                    style: infoStyle),
              ),
            ),
          );
        }
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            final foodItems = FoodModel()
                .foodItems
                .where((food) =>
                    food.categoryIndex == tabIndex &&
                    food.restaurant == selectedRestaurantName)
                .toList();

            final food = foodItems[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodInfo(foods: food),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text(food.name),
                  subtitle: const Text('Chicken, Soup'),
                  trailing: const Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: FoodModel()
              .foodItems
              .where((food) =>
                  food.categoryIndex == tabIndex &&
                  food.restaurant == selectedRestaurantName)
              .length,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  width: double.infinity,
                  height: screenWidth - 140,
                  child: PortraitLandscapeStack(
                      widget: widget,
                      screenWidth: screenWidth,
                      context: context,
                      orientation: orientation),
                ),
                _buildsWholeRestaurantDescription(
                    paddingSize, screenWidth, orientation),
                Expanded(
                  child: Column(
                    children: [
                      _buildTabBar(),
                      _buildPortraitTabBarView(paddingSize)
                    ],
                  ),
                ),
              ],
            )
          : NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                      child: _buildCarousel(orientation, screenWidth)),
                  SliverToBoxAdapter(
                    child: _buildsWholeRestaurantDescription(
                        paddingSize, screenWidth, orientation),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(
                      indicatorColor: prmColor,
                      controller: _tabController,
                      labelColor: Colors.black,
                      isScrollable: true,
                      tabs: myTabs,
                      dividerColor: prmColor,
                    ),
                  ),
                ];
              },
              body: _buildLandscapeTabBarView(paddingSize),
            ),
    );
  }
}
