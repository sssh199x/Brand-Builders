import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';

class BuisnessSearchBoxHeader extends StatefulWidget {
  const BuisnessSearchBoxHeader({super.key});

  @override
  State<BuisnessSearchBoxHeader> createState() =>
      _BuisnessSearchBoxHeaderState();
}

class _BuisnessSearchBoxHeaderState extends State<BuisnessSearchBoxHeader> {
  @override
  Widget build(BuildContext context) {
    List<String> listOfPlaces = ['Anytype', 'In site', 'Deliver'];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingSizeForPortrait = screenWidth * 0.04;
    double paddingSizeForLandscape = screenWidth * 0.018;
    Orientation orientation = MediaQuery.of(context).orientation;
    int selectedItem = 0;

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

    Future<dynamic> buildShowModalBottomSheet() {
      return showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        constraints: orientation == Orientation.portrait
            ? BoxConstraints.tightForFinite(
                height: screenHeight -
                    (TStatusBarColor.getStatusBarHeight(context) * 1.2),
                width: double.infinity)
            : BoxConstraints.tightForFinite(
                height: screenHeight - 30, width: double.infinity),
        context: context,
        builder: (context) {
          return Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: orientation == Orientation.portrait
                    ? EdgeInsets.only(
                        left: paddingSizeForPortrait,
                        right: paddingSizeForPortrait)
                    : EdgeInsets.only(
                        left: paddingSizeForLandscape,
                        right: paddingSizeForLandscape),
                color: Colors.black12,
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
              const Divider(thickness: 2.0),
              Container(
                //color: Colors.amber,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: paddingSizeForPortrait,
                    right: paddingSizeForPortrait),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Types of places',
                      style: infoStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Premium Selections: Experience the Best',
                      style: infoStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF5F6980)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          //color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemCount: listOfPlaces.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('$selectedItem');
                                    setState(() {
                                      setSelectedItem(index);
                                    });
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 129,
                                      height: 50,
                                      color: index == selectedItem
                                          ? prmColor
                                          : Colors.transparent,
                                      child: Text(listOfPlaces[index])),
                                ),
                                index != 2
                                    ? Container(
                                        height: 50,
                                        width: 2,
                                        color: Colors
                                            .black, // Set the color of the divider
                                      )
                                    : Container(
                                        height: 50,
                                        width: 2,
                                        color: Colors
                                            .transparent, // Set the color of the divider
                                      ),
                              ],
                            );
                          },
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     const Text('Anytype'),
                        //     Container(
                        //       height: double.infinity,
                        //       width: 2,
                        //       color: Colors.black, // Set the color of the divider
                        //     ),
                        //     const Text('In Site'),
                        //     Container(
                        //       height: double.infinity,
                        //       width: 2,
                        //       color: Colors.black, // Set the color of the divider
                        //     ),
                        //     const Text('Deliver')
                        //   ],
                        // ),
                        )
                  ],
                ),
              )
            ],
          );
        },
      );
    }

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
}
