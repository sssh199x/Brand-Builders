import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'favourites/favourites.dart';
import 'popular/popular.dart';
import 'explore/explore.dart';
import 'orders/previous_orders.dart';
import 'searchbox_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prmColor,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 260) {
              return SingleChildScrollView(
                //?? whats this for ?
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: 260,
                    height: MediaQuery.of(context).size.height,
                    child: const ScrollableView()),
              );
            } else {
              return const ScrollableView();
            }
          },
        ),
      ),
    );
  }
}

class ScrollableView extends StatelessWidget {
  const ScrollableView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBoxHeader(),
          PopularRestaurants(),
          ExploreFood(),
          PreviousOrders(),
          FavouriteRestaurants(),
        ],
      ),
    );
  }
}
