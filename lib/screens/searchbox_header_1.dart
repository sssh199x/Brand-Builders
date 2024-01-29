import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ordering_app/res/constants.dart';

// Define a data class for the service options
class ServiceOption {
  final String optionText;
  bool isSelected;

  ServiceOption({required this.optionText, required this.isSelected});
}

class PaymentOption {
  final String optionText;
  bool isSelected;
  PaymentOption({required this.optionText, required this.isSelected});
}

class AccesibilityFeature {
  final String optionText;
  bool isSelected;
  AccesibilityFeature({required this.optionText, required this.isSelected});
}

class HostLanguage {
  final String optionText;
  bool isSelected;
  HostLanguage({required this.optionText, required this.isSelected});
}

class BuisnessSearchBoxHeader extends StatefulWidget {
  const BuisnessSearchBoxHeader({super.key});

  @override
  State<BuisnessSearchBoxHeader> createState() =>
      _BuisnessSearchBoxHeaderState();
}

class _BuisnessSearchBoxHeaderState extends State<BuisnessSearchBoxHeader> {
  List<PaymentOption> paymentOptions = [
    PaymentOption(optionText: 'Cash', isSelected: false),
    PaymentOption(optionText: 'Credit Cards', isSelected: false),
    PaymentOption(optionText: 'Digital Payment', isSelected: false)
  ];
  List<ServiceOption> serviceOptions = [
    ServiceOption(optionText: 'Delivery', isSelected: false),
    ServiceOption(optionText: 'Appointment', isSelected: false),
    ServiceOption(optionText: 'In-store', isSelected: false),
  ];
  List<AccesibilityFeature> accesibilityFeatures = [
    AccesibilityFeature(optionText: 'Wheelchair', isSelected: false),
    AccesibilityFeature(optionText: 'Parking', isSelected: false),
    AccesibilityFeature(optionText: 'Allows Pets', isSelected: false)
  ];
  List<HostLanguage> hostLanguages = [
    HostLanguage(optionText: 'Nepali', isSelected: false),
    HostLanguage(optionText: 'English', isSelected: false),
    HostLanguage(optionText: 'Others', isSelected: false)
  ];

  List<String> listOfPlaces = ['Anytype', 'In site', 'Deliver'];
  List<String> operatingHours = ['Open Now', 'Specific Hours'];
  int selectedItem = 0;
  int selectedItemHours = 0;
  RangeValues _currentRangeValues = const RangeValues(40, 1200);

  void setSelectedItem(int index) {
    selectedItem = index;
  }

  void setSelectedItemHours(int index) {
    selectedItemHours = index;
  }

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

  Future<dynamic> buildShowModalBottomSheet(
          Orientation orientation,
          double paddingSizeForPortrait,
          double paddingSizeForLandscape,
          double screenWidth) =>
      showModalBottomSheet(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: paddingSizeForPortrait),
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
                            physics: const NeverScrollableScrollPhysics(),
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfPlaces.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setStateSB(() {
                                    // print(selectedItem);
                                    setSelectedItem(index);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: orientation == Orientation.portrait
                                      ? screenWidth / 3.5833
                                      : screenWidth / 6.6571, //120 : 140
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
                    buildTitleAndSubtitle(paddingSizeForPortrait, 'Price Range',
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
                          //print('$_currentRangeValues');
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
                        minRating: 0,
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
                    buildTitleAndSubtitle(
                        paddingSizeForPortrait,
                        'Operating Hours',
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
                          ? EdgeInsets.symmetric(
                              horizontal: paddingSizeForPortrait)
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: operatingHours.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setStateSB(() {
                                    setSelectedItemHours(index);
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  alignment: Alignment.center,
                                  width: orientation == Orientation.portrait
                                      ? screenWidth / 4.6236
                                      : screenWidth / 10.0125, //93 : 93
                                  height: orientation == Orientation.portrait
                                      ? screenWidth / 11.6216
                                      : screenWidth / 25.1891,
                                  decoration: BoxDecoration(
                                      color: index == selectedItemHours
                                          ? const Color(0xFF5F6980)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.black)),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      operatingHours[index],
                                      style: infoStyle.copyWith(
                                          color: index == selectedItemHours
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
                      margin: EdgeInsets.symmetric(
                          horizontal: paddingSizeForPortrait),
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
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: serviceOptions.length,
                              itemBuilder: (context, index) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      serviceOptions[index].optionText,
                                      style: infoStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Switch(
                                    // This bool value toggles the switch.
                                    value: serviceOptions[index].isSelected,
                                    activeColor: prmColor,
                                    onChanged: (bool value) {
                                      // This is called when the user toggles the switch.
                                      setStateSB(() {
                                        serviceOptions[index].isSelected =
                                            value;
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
                        'Payment Options',
                        'Payment Your Way: Fast,Flexible,Secure'),
                    buildCheckbox(
                      paddingSizeForPortrait,
                      setStateSB,
                      paymentOptions,
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
                        accesibilityFeatures, (option) {
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
                      margin: EdgeInsets.symmetric(
                          horizontal: paddingSizeForPortrait),
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
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: hostLanguages.length,
                              itemBuilder: (context, index) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      hostLanguages[index].optionText,
                                      style: infoStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: prmColor,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: hostLanguages[index].isSelected,
                                    onChanged: (bool? value) {
                                      setStateSB(() {
                                        hostLanguages[index].isSelected =
                                            value!; // Pass the entire option to the callback
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
          );
        },
      );

  Container buildCheckbox(double paddingSizeForPortrait, StateSetter setStateSB,
      List<dynamic> options, Function(dynamic) onChangedCallback) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingSizeForPortrait),
      width: double.infinity,
      height: 135,
      //color: Colors.black12,
      child: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: paymentOptions.length,
          itemBuilder: (context, index) =>
              buildCheckboxItem(options[index], onChangedCallback, setStateSB)),
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
                buildShowModalBottomSheet(orientation, paddingSizeForPortrait,
                    paddingSizeForLandscape, screenWidth);
              },
              icon: const Icon(
                Icons.format_list_bulleted_rounded,
                size: 30,
              )),
        ));
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
    );
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
