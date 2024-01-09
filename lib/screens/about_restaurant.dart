import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';

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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildPortraitStack(
      double screenWidth, BuildContext context, double paddingSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: screenWidth - 160,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.restaurant.image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: screenWidth / 2.1694, //180,
            child: Align(
              child: SizedBox(
                width: screenWidth / 5.1428, //i.e 80
                height: screenWidth / 5.1428,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.restaurant.image),
                          fit: BoxFit.cover)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            left: 10,
            child: Align(
              child: SizedBox(
                width: screenWidth / 10.2857, // 40
                height: screenWidth / 10.2857,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 10,
            child: Align(
              child: SizedBox(
                width: screenWidth / 10.2857, // 40
                height: screenWidth / 10.2857,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildLandscapeStack(
      double screenWidth, BuildContext context, double paddingSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: screenWidth - 720,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.restaurant.image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: screenWidth / 9.7733, //87,
            child: Align(
              child: SizedBox(
                width: screenWidth / 13.7142, //i.e 62
                height: screenWidth / 13.71425,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.restaurant.image),
                          fit: BoxFit.cover)),
                ),
              ),
            )),
        Positioned(
          top: 10,
          left: 10,
          child: Align(
            child: SizedBox(
              width: screenWidth / 24.2938, //35
              height: screenWidth / 24.2938,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    iconSize: 15,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Align(
            child: SizedBox(
              width: screenWidth / 24.2938, //35
              height: screenWidth / 24.2938,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    iconSize: 15,
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
        ),
      ],
    );
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
              onPressed: () {},
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
    return Container(
      height: orientation == Orientation.portrait
          ? screenWidth / 3.3
          : screenWidth / 8,
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        children: [
          _buildRestaurantName(paddingSize),
          _buildRestaurantDescription(paddingSize),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            color: Colors.amber,
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
                  //color: Colors.amber,
                  width: double.infinity,
                  height: orientation == Orientation.portrait
                      ? screenWidth - 140
                      : screenWidth - 700,
                  child: orientation == Orientation.portrait
                      ? _buildPortraitStack(screenWidth, context, paddingSize)
                      : _buildLandscapeStack(screenWidth, context, paddingSize),
                ),
                _buildsWholeRestaurantDescription(
                    paddingSize, screenWidth, orientation),
                Column(
                  
                  children: [
                    Container(
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
                            child: Text('Pizza',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Chowmein',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Snacks',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Seafood',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Burger',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: txtColor,
                        tabAlignment: TabAlignment.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: screenWidth - 15,
                      width: screenWidth,
                      //color: Colors.black12,

                      child: TabBarView(
                        controller: _tabController,
                         children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                                                ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                                                ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                                                ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                                                ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                                                ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: const ListTile(
                                  style: ListTileStyle.drawer,
                                  
                                  title: Text('Appolo Pizza'),
                                  subtitle: Text('Chicken,,Mushroom'),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                        
                      ]),
                    ),
                  ],
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    //color: Colors.amber,
                    width: double.infinity,
                    height: orientation == Orientation.portrait
                        ? screenWidth - 140
                        : screenWidth - 700,
                    child: orientation == Orientation.portrait
                        ? _buildPortraitStack(screenWidth, context, paddingSize)
                        : _buildLandscapeStack(
                            screenWidth, context, paddingSize),
                  ),
                  _buildsWholeRestaurantDescription(
                      paddingSize, screenWidth, orientation),
                  Column(children: [
                    Container(
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
                            child: Text('Pizza',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Chowmein',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Snacks',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Seafood',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                            child: Text('Burger',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: txtColor,
                        tabAlignment: TabAlignment.center,
                      ),
                    ),
                    Container(
                      height: screenWidth - 300,
                      width: screenWidth,
                      color: Colors.black12,
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Center(
                              child: Text("It's cloudy here",
                                  style: TextStyle(color: txtColor)),
                            ),
                            Center(
                              child: Text("It's rainy here"),
                            ),
                            Center(
                              child: Text("It's sunny here"),
                            ),
                            Center(
                              child: Text("It's cloudy here"),
                            ),
                            Center(
                              child: Text("It's rainy here"),
                            ),
                            Center(
                              child: Text("It's sunny here"),
                            ),
                          ]),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}
