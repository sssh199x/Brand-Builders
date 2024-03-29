import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:provider/provider.dart';
import '../../res/constants.dart';
import '../../provider/location.dart';

class SearchBoxHeader extends StatefulWidget {
  const SearchBoxHeader({super.key});

  @override
  State<SearchBoxHeader> createState() => _SearchBoxHeaderState();
}

class _SearchBoxHeaderState extends State<SearchBoxHeader> {
  @override
  void initState() {
    super.initState();
    LocationProvider provider =
        Provider.of<LocationProvider>(context, listen: false);
    if (provider.address == 'No Location') {
      provider.getLocationPermission();
    }
  }

  //Provides  the width of the text i.e address
  // double calculateTextWidth(String text, TextStyle style) {
  //   final TextPainter textPainter = TextPainter(
  //     text: TextSpan(text: text, style: style),
  //     textDirection: TextDirection.ltr,
  //   )..layout();
  //   return textPainter.width;
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingSize = screenWidth * 0.04;
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: 110,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: paddingSize,
              right: paddingSize,
              bottom: 24,
              top: 10,
            ),
            height: 88,
            decoration: const BoxDecoration(
              color: prmColor,
            ),
            child: Consumer<LocationProvider>(builder: (context, value, child) {
              String address = value.address;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (address == 'No Location' ||
                          address == 'No Location Provided') {
                        value.getLocationPermission();
                      }
                    },
                  ),
                  _buildAddressWidget1(
                    context,
                    value,
                    screenWidth,
                  ),
                  const Spacer(),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        print('Hello');
                      },
                      icon: const Icon(Icons.circle_notifications_outlined),
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildSearchBox(paddingSize),
          ),
        ],
      ),
    );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: bgColor,
        backgroundColor: prmColor,
        title:
            const Text('Choose a location', style: TextStyle(color: bgColor)),
      ),
      body: Consumer<LocationProvider>(builder: (context, value, child) {
        return OpenStreetMapSearchAndPick(
          onPicked: (pickedData) async {
            try {
              value.setAddress(pickedData.addressName);

              value.setCurrentPosition(pickedData.latLong);

              Navigator.of(context).pop();
            } catch (e) {
              print("Error in onPicked callback: $e");
            }
          },
          buttonColor: prmColor,
        );
      }),
    );
  }
}

Widget _buildSearchBox(double paddingSize) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: paddingSize),
    height: 44,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 5,
          color: Colors.black.withOpacity(0.5),
        ),
      ],
    ),
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: "Search food or restaurant",
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: txtColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: IconButton(
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildAddressWidget1(
  BuildContext context,
  LocationProvider value,
  double screenWidth,
) {
  String address = value.address;
  return address == 'No Location'
      ? const CircularProgressIndicator()
      : Container(
          //color: Colors.red,
          child: address == 'No Location Provided'
              ? InkWell(
                  onTap: () {
                    value.getLocationPermission();
                  },
                  child: Text(
                    address,
                    style: addStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CurrentLocation()),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Delivery To', style: addStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        // Ensure the Row has a finite width constraint
                        width: screenWidth - 180,
                        // You can adjust this as needed
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 20,
                                child: Marquee(
                                  startAfter: const Duration(seconds: 2),
                                  text: address,
                                  style: addStyle,
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  blankSpace: 5.0,
                                  velocity: 50.0,
                                  pauseAfterRound: const Duration(seconds: 1),
                                  accelerationDuration:
                                      const Duration(seconds: 1),
                                  accelerationCurve: Curves.linear,
                                  decelerationDuration:
                                      const Duration(milliseconds: 500),
                                  decelerationCurve: Curves.easeOut,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
}
