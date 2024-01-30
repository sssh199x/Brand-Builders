import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ordering_app/provider/filter_options.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:provider/provider.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
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
    );
  }

  Consumer<FilterOptions> buildCheckbox(
      double paddingSizeForPortrait,
      StateSetter setStateSB,
      List<dynamic> options,
      Function(dynamic) onChangedCallback) {
    return Consumer<FilterOptions>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
        width: double.infinity,
        height: 135,
        //color: Colors.black12,
        child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: value.paymentOptions.length,
            itemBuilder: (context, index) => buildCheckboxItem(
                options[index], onChangedCallback, setStateSB)),
      ),
    );
  }

  Row buildCheckboxItem(
    dynamic option,
    Function(dynamic) onChangedCallback,
    StateSetter setStateSB,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            option.optionText, // Assuming options have an 'optionText' property
            style: infoStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Checkbox(
          checkColor: prmColor,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: option.isSelected,
          onChanged: (bool? value) {
            setStateSB(() {
              onChangedCallback(
                  option); // Pass the entire option to the callback
            });
          },
        ),
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    // for onHovered
    if (states.any(interactiveStates.contains)) {
      return Colors.black12;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingSizeForPortrait = screenWidth * 0.04;
    double paddingSizeForLandscape = screenWidth * 0.018;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Consumer<FilterOptions>(
      builder: (context, value, child) => StatefulBuilder(
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
              // Settinng addAutomaticKeepAlives and addRepaintBoundaries to false optimizes memory usage in a Listview.Reduces memory consumption ,especially when working with high resolution images
              addAutomaticKeepAlives: false, // true by default
              addRepaintBoundaries: false, //true by default
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
                buildTitleAndSubtitle(paddingSizeForPortrait, 'Types of places',
                    'Premium Selections: Experience the Best'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
                  height: orientation == Orientation.portrait
                      ? screenWidth / 7.1666
                      : screenWidth / 15.5333, //60 : 60
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  child: Row(children: [
                    Expanded(
                      child: ListView.builder(
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listOfPlaces.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // setStateSB(() {
                              //   // print(selectedItem);
                              //   //setSelectedItem(index);
                              //   value.setSelectedItem(index);
                              // }
                              // );
                              value.setSelectedItem(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: orientation == Orientation.portrait
                                  ? screenWidth / 3.5833
                                  : screenWidth / 6.6571, //120 : 140
                              decoration: BoxDecoration(
                                color: index == value.selectedItem
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
                                  child: Text(value.listOfPlaces[index])),
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
                buildTitleAndSubtitle(paddingSizeForPortrait, 'Price Range',
                    'Choose Your Budget: Find Options That Fit'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${value.currentRangeValues.start.toInt().toString()}",
                          style: infoStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "\$${value.currentRangeValues.end.toInt().toString()}",
                          style: infoStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                RangeSlider(
                  activeColor: prmColor,
                  values: value.currentRangeValues,
                  max: 1600,
                  divisions: 80,
                  onChanged: (RangeValues values) {
                    // setStateSB(() {
                    //   value.setSelectedRange(values);
                    //   //print('$_currentRangeValues');
                    // });
                    value.setSelectedRange(values);
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
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      //print(rating);
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
                buildTitleAndSubtitle(paddingSizeForPortrait, 'Operating Hours',
                    'Find Your Perfect Time: Filter by Business Hours'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: orientation == Orientation.portrait
                      ? screenWidth / 11.6216
                      : screenWidth / 25.1891, // 37 : 37
                  //color: Colors.amber,
                  margin: orientation == Orientation.portrait
                      ? EdgeInsets.symmetric(horizontal: paddingSizeForPortrait)
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          addAutomaticKeepAlives: false,
                          addRepaintBoundaries: false,
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.operatingHours.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // setStateSB(() {
                              //   value.setSelectedItemHours(index);
                              // });
                              value.setSelectedItemHours(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              alignment: Alignment.center,
                              width: orientation == Orientation.portrait
                                  ? screenWidth / 4.6236
                                  : screenWidth / 10.0125, //93 : 93
                              height: orientation == Orientation.portrait
                                  ? screenWidth / 11.6216
                                  : screenWidth / 25.1891,
                              decoration: BoxDecoration(
                                  color: index == value.selectedItemHours
                                      ? const Color(0xFF5F6980)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: Colors.black)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  value.operatingHours[index],
                                  style: infoStyle.copyWith(
                                      color: index == value.selectedItemHours
                                          ? bgColor
                                          : txtColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
                  width: double.infinity, //335
                  height: 173, //173
                  //color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Service Options',
                          style: infoStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          addAutomaticKeepAlives: false,
                          addRepaintBoundaries: false,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: value.serviceOptions.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.serviceOptions[index].optionText,
                                  style: infoStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Switch(
                                // This bool value toggles the switch.
                                value: value.serviceOptions[index].isSelected,
                                activeColor: prmColor,
                                onChanged: (bool switchValue) {
                                  // This is called when the user toggles the switch.
                                  // setStateSB(() {
                                  //   value.toggleSwitch(index, switchValue);
                                  // });
                                  value.toggleSwitch(index, switchValue);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                buildTitleAndSubtitle(paddingSizeForPortrait, 'Payment Options',
                    'Payment Your Way: Fast,Flexible,Secure'),
                buildCheckbox(
                  paddingSizeForPortrait,
                  setStateSB,
                  value.paymentOptions,
                  (option) {
                    // Handle checkbox changes for payment options
                    option.isSelected = !option.isSelected;
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
                buildTitleAndSubtitle(
                    paddingSizeForPortrait,
                    'Accesibility Features',
                    'Enhancing Experience,Embracing Diversity'),
                buildCheckbox(paddingSizeForPortrait, setStateSB,
                    value.accesibilityFeatures, (option) {
                  option.isSelected = !option.isSelected;
                }),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: paddingSizeForPortrait,
                  endIndent: paddingSizeForPortrait,
                  thickness: 2.0,
                  color: Colors.black38,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
                  width: double.infinity, //335
                  height: 173, //173
                  //color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Host Languages',
                          style: infoStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          addAutomaticKeepAlives: false,
                          addRepaintBoundaries: false,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: value.hostLanguages.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.hostLanguages[index].optionText,
                                  style: infoStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Checkbox(
                                checkColor: prmColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: value.hostLanguages[index].isSelected,
                                onChanged: (bool? switchValue) {
                                  setStateSB(() {
                                    // hostLanguages[index].isSelected =
                                    //     value!; // Pass the entire option to the callback
                                    value.toggleCheckbox(index, switchValue!);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
