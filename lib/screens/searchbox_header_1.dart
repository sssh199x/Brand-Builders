import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/bottom_sheet_content.dart';

class BuisnessSearchBoxHeader extends StatefulWidget {
  const BuisnessSearchBoxHeader({super.key});

  @override
  State<BuisnessSearchBoxHeader> createState() =>
      _BuisnessSearchBoxHeaderState();
}

class _BuisnessSearchBoxHeaderState extends State<BuisnessSearchBoxHeader> {
  Widget buildSearchBox(
    Orientation orientation,
    double paddingSizeForPortrait,
    double paddingSizeForLandscape,
    double screenWidth,
  ) {
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

  Future<dynamic> buildShowModalBottomSheet() async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => const BottomSheetContent(),
    );
  }

  Widget buildFilterButton(
      Orientation orientation,
      double paddingSizeForPortrait,
      double paddingSizeForLandscape,
      double screenWidth) {
    return Expanded(
        flex: 0,
        child: Container(
          margin: orientation == Orientation.portrait
              ? EdgeInsets.only(
                  right: paddingSizeForPortrait, top: paddingSizeForPortrait)
              : EdgeInsets.only(
                  right: paddingSizeForLandscape, top: paddingSizeForLandscape),
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingSizeForPortrait = screenWidth * 0.04;
    double paddingSizeForLandscape = screenWidth * 0.018;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSearchBox(orientation, paddingSizeForPortrait,
            paddingSizeForLandscape, screenWidth),
        buildFilterButton(orientation, paddingSizeForPortrait,
            paddingSizeForLandscape, screenWidth),
      ],
    );
  }
}
