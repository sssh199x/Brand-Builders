import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
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
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        indicatorColor: txtColor,
        tabAlignment: TabAlignment.center,
      ),
    );
  }

  Widget _buildPortraitTabBarView() {
    return Expanded(
      child: TabBarView(controller: _tabController, children: [
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ]),
    );
  }

  Widget _buildLandscapeTabBarView(double screenWidth) {
    return SizedBox(
      height: screenWidth + screenWidth / 2,
      width: double.infinity,
      //color: Colors.black12,
      child: TabBarView(controller: _tabController, children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodInfo(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text('Chicken Momo'),
                  subtitle: Text('Chicken,Soup'),
                  trailing: Text('Rs 500'),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
      ]),
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
                      paddingSize: paddingSize,
                      orientation: orientation),
                ),
                _buildsWholeRestaurantDescription(
                    paddingSize, screenWidth, orientation),
                Expanded(
                  child: Column(
                    children: [_buildTabBar(), _buildPortraitTabBarView()],
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    width: double.infinity,
                    height: screenWidth - 700,
                    child: PortraitLandscapeStack(
                        widget: widget,
                        screenWidth: screenWidth,
                        context: context,
                        paddingSize: paddingSize,
                        orientation: orientation),
                  ),
                  _buildsWholeRestaurantDescription(
                      paddingSize, screenWidth, orientation),
                  _buildTabBar(),
                  _buildLandscapeTabBarView(screenWidth),
                ],
              ),
            ),
    );
  }
}
