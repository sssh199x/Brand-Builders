import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ordering_app/res/constants.dart';

class BuisnessSearchBoxHeader extends StatefulWidget {
  const BuisnessSearchBoxHeader({super.key});

  @override
  State<BuisnessSearchBoxHeader> createState() =>
      _BuisnessSearchBoxHeaderState();
}

class _BuisnessSearchBoxHeaderState extends State<BuisnessSearchBoxHeader> {
  List<String> listOfPlaces = ['Anytype', 'In site', 'Deliver'];
  int selectedItem = 0;
  RangeValues _currentRangeValues = const RangeValues(40, 1200);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingSizeForPortrait = screenWidth * 0.04;
    double paddingSizeForLandscape = screenWidth * 0.018;
    Orientation orientation = MediaQuery.of(context).orientation;

    void setSelectedItem(int index) {
      selectedItem = index;
    }

    Widget buildSearchBox() {
      return Expanded(
        child: Container(
          margin: orientation == Orientation.portrait
              ? EdgeInsets.only(
                  top: paddingSizeForPortrait,
                  left: paddingSizeForPortrait,
                  right: paddingSizeForPortrait)
              : EdgeInsets.only(
                  top: paddingSizeForLandscape,
                  left: paddingSizeForLandscape,
                  right: paddingSizeForLandscape),
          height: orientation == Orientation.portrait
              ? screenWidth / 6.1428
              : screenWidth / 15.5333, //70:60
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          child: Container(
            margin: orientation == Orientation.portrait
                ? EdgeInsets.only(left: paddingSizeForPortrait)
                : EdgeInsets.only(left: paddingSizeForLandscape),
            child: TextField(
              maxLines: 2,
              onChanged: (value) {},
              decoration: InputDecoration(
                //contentPadding:
                //  const EdgeInsets.symmetric(vertical: 10),
                hintText: "Where To?\nAnyplace - Anytime - Anywhere",
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: txtColor,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: IconButton(
                  icon: const FittedBox(
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  onPressed: () {},
                ),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    Future<dynamic> buildShowModalBottomSheet() => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          //isDismissible: false,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setStateSB) => DraggableScrollableSheet(
                initialChildSize: 0.92,
                minChildSize: 0.5,
                maxChildSize: 0.92,
                builder: (context, scrollController) => Container(
                  //margin: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        margin: orientation == Orientation.portrait
                            ? EdgeInsets.only(
                                left: paddingSizeForPortrait,
                                right: paddingSizeForPortrait)
                            : EdgeInsets.only(
                                left: paddingSizeForLandscape,
                                right: paddingSizeForLandscape),
                        //color: Colors.black12,
                        width: double.infinity,
                        //height: 60,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close)),
                            Text(
                              'Filters',
                              style: infoStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.black38,
                      ),
                      buildTitleAndSubtitle(
                          paddingSizeForPortrait,
                          'Types of places',
                          'Premium Selections: Experience the Best'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: paddingSizeForPortrait),
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)),
                        child: Row(children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: listOfPlaces.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setStateSB(() {
                                      print(selectedItem);
                                      setSelectedItem(index);
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: index == selectedItem
                                          ? prmColor
                                          : Colors.transparent,
                                      border: const Border(
                                          bottom: BorderSide(width: 2.0),
                                          top: BorderSide(width: 2.0),
                                          left: BorderSide(
                                            width: 2.0,
                                          ),
                                          right: BorderSide(
                                            width: 2.0,
                                          )),
                                      borderRadius:
                                          const BorderRadiusDirectional.only(
                                        bottomEnd: Radius.circular(12),
                                        topEnd: Radius.circular(12),
                                        topStart: Radius.circular(12),
                                        bottomStart: Radius.circular(12),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Text(listOfPlaces[index])),
                                  ),
                                );
                              },
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: paddingSizeForPortrait,
                        endIndent: paddingSizeForPortrait,
                        thickness: 2.0,
                        color: Colors.black38,
                      ),
                      buildTitleAndSubtitle(
                          paddingSizeForPortrait,
                          'Price Range',
                          'Choose Your Budget: Find Options That Fit'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: paddingSizeForPortrait),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${_currentRangeValues.start.toInt().toString()}",
                                style: infoStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "\$${_currentRangeValues.end.toInt().toString()}",
                                style: infoStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                      RangeSlider(
                        activeColor: prmColor,
                        values: _currentRangeValues,
                        max: 1600,
                        divisions: 80,
                        // labels: RangeLabels(
                        //   _currentRangeValues.start.toInt().toString(),
                        //   _currentRangeValues.end.toInt().toString(),
                        // ),
                        onChanged: (RangeValues values) {
                          setStateSB(() {
                            _currentRangeValues = values;
                            print('$_currentRangeValues');
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: paddingSizeForPortrait,
                        endIndent: paddingSizeForPortrait,
                        thickness: 2.0,
                        color: Colors.black38,
                      ),
                      buildTitleAndSubtitle(paddingSizeForPortrait, 'Ratings',
                          'Find The Best: Filter By Top Ratings'),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: RatingBar.builder(
                          itemSize: 50,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: paddingSizeForPortrait,
                        endIndent: paddingSizeForPortrait,
                        thickness: 2.0,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );

    Widget buildFilterButton() {
      return Expanded(
          flex: 0,
          child: Container(
            margin: orientation == Orientation.portrait
                ? EdgeInsets.only(
                    right: paddingSizeForPortrait, top: paddingSizeForPortrait)
                : EdgeInsets.only(
                    right: paddingSizeForLandscape,
                    top: paddingSizeForLandscape),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    width: 2.0,
                    color: txtColor,
                  ),
                  left: BorderSide(color: txtColor, width: 2.0),
                  right: BorderSide(color: txtColor, width: 2.0),
                  top: BorderSide(color: txtColor, width: 2.0)),
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {
                  buildShowModalBottomSheet();
                },
                icon: const Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 30,
                )),
          ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSearchBox(),
        buildFilterButton(),
      ],
    );
  }

  Container buildTitleAndSubtitle(
      double paddingSizeForPortrait, String title, String subtitle) {
    return Container(
      //color: Colors.amber,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: paddingSizeForPortrait, right: paddingSizeForPortrait),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                infoStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            subtitle,
            style: infoStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF5F6980)),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ); //'Types of places'
    // 'Premium Selections: Experience the Best'
  }
}
