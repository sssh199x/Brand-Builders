import 'package:flutter/material.dart';
import 'package:ordering_app/provider/restaurant_model.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/map_utils.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.restaurant});
  final Restaurant restaurant;

  // This works but i need google api key....
  // String _buildMapImageUrl(double latitude, double longitude) {
  //   // Google Maps Static API URL for a dynamic map image
  //   final apiKey =
  //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'; // Replace with your API key
  //   const zoomLevel = 15;
  //   const imageSize = '600x300'; // Adjust the size as needed

  //   return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=$zoomLevel&size=$imageSize&key=$apiKey';
  // }

  Widget _buildMapsContainer(BuildContext context, double paddingSize,
      double screenWidth, Orientation orientation) {
    return GestureDetector(
      onTap: () async {
        return await MapUtils.openMap(
            restaurant.latitude, restaurant.longitude, context);
      },
      child: Container(
        margin: EdgeInsets.only(left: paddingSize, right: paddingSize),
        width: double.infinity,
        height: orientation == Orientation.portrait
            ? screenWidth - 250
            : screenWidth / 6,
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/staticmap.png')),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Container(
              width: orientation == Orientation.portrait ? 35 : 40,
              height: orientation == Orientation.portrait ? 35 : 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(restaurant.image), fit: BoxFit.cover),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(restaurant.name)),
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                _buildMapsContainer(
                    context, paddingSize, screenWidth, orientation),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: paddingSize, right: paddingSize),
                  width: double.infinity,
                  height: screenWidth - 100,
                  // /color: Colors.black12,
                  child: Column(
                    children: [
                      ListTileBuilder(
                        restaurant: restaurant,
                        restaurantName: restaurant.name,
                        restaurantSubtitle: restaurant.location,
                        leadingIcon: const Icon(Icons.location_city),
                        trailingIconButton: IconButton(
                            onPressed: () async {
                              return await MapUtils.openMap(restaurant.latitude,
                                  restaurant.longitude, context);
                            },
                            icon: const Icon(Icons.arrow_outward)),
                      ),
                      ListTileBuilder(
                        restaurant: restaurant,
                        restaurantName: restaurant.contactno,
                        leadingIcon: const Icon(Icons.call),
                        trailingIconButton: IconButton(
                          onPressed: () async {
                            return await MapUtils.openDialPad(
                                restaurant.contactno, context);
                          },
                          icon: const Icon(Icons.arrow_outward),
                        ),
                      ),
                      ListTileBuilder(
                          restaurant: restaurant,
                          restaurantName: 'Delivery Time',
                          leadingIcon: const Icon(Icons.timer),
                          trailingIconButton: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.expand_more))),
                    ],
                  ),
                )
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildMapsContainer(
                      context, paddingSize, screenWidth, orientation),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: paddingSize, right: paddingSize),
                    width: double.infinity,
                    height: screenWidth / 3,
                    //color: Colors.black12,
                    child: Column(
                      children: [
                        ListTileBuilder(
                          restaurant: restaurant,
                          restaurantName: restaurant.name,
                          restaurantSubtitle: restaurant.location,
                          leadingIcon: const Icon(Icons.location_city),
                          trailingIconButton: IconButton(
                              onPressed: () async {
                                return await MapUtils.openMap(
                                    restaurant.latitude,
                                    restaurant.longitude,
                                    context);
                              },
                              icon: const Icon(Icons.arrow_outward)),
                        ),
                        ListTileBuilder(
                          restaurant: restaurant,
                          restaurantName: restaurant.contactno,
                          leadingIcon: const Icon(Icons.call),
                          trailingIconButton: IconButton(
                            onPressed: () async {
                              return await MapUtils.openDialPad(
                                  restaurant.contactno, context);
                            },
                            icon: const Icon(Icons.arrow_outward),
                          ),
                        ),
                        ListTileBuilder(
                            restaurant: restaurant,
                            restaurantName: 'Delivery Time',
                            leadingIcon: const Icon(Icons.timer),
                            trailingIconButton: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.expand_more))),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class ListTileBuilder extends StatelessWidget {
  const ListTileBuilder(
      {super.key,
      required this.restaurant,
      required this.restaurantName,
      this.restaurantSubtitle = '',
      required this.leadingIcon,
      required this.trailingIconButton});

  final Restaurant restaurant;
  final String restaurantName;
  final String restaurantSubtitle;
  final Widget leadingIcon;
  final Widget trailingIconButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(
        restaurantName,
        style: infoStyle,
      ),
      subtitle: Text(
        restaurantSubtitle,
      ),
      trailing: trailingIconButton,
      contentPadding: const EdgeInsets.only(right: 0),
    );
  }
}
