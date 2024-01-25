import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:ordering_app/res/constants.dart';

class FoodInfo extends StatefulWidget {
  const FoodInfo({super.key, required this.foods});
  final Food foods;

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  int _counterValue = 0;
  bool isLoading = false; // Add this line to manage loading state

  // Function to start loading and simulate delay
  void startLoading() {
    setState(() {
      isLoading = true;
    });

    // Simulate a delay (e.g., 2 seconds) before stopping the loading state
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget _buildPortraitStackForFoodInfo(
      BuildContext context,
      Orientation orientation,
      double screenWidth,
      double paddingSize,
      double landscapepaddingSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: double.infinity,
              height: orientation == Orientation.portrait
                  ? screenWidth - 160
                  : screenWidth - 720,
              child: orientation == Orientation.portrait
                  ? Container(
                      margin: EdgeInsets.only(
                          top: paddingSize,
                          left: paddingSize,
                          right: paddingSize),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.foods.image),
                            fit: BoxFit.cover),
                      ),
                    )
                  : Container(
                      // margin: EdgeInsets.all(landscapepaddingSize),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.foods.image),
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
            top: orientation == Orientation.portrait ? 20 : 20,
            left: orientation == Orientation.portrait ? 10 : 15,
            child: Align(
              child: SizedBox(
                width: orientation == Orientation.portrait
                    ? screenWidth / 9.1428
                    : screenWidth / 24.2938, // 45 : 35
                height: orientation == Orientation.portrait
                    ? screenWidth / 13.7142 //30
                    : screenWidth / 24.2938,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize:
                          orientation == Orientation.portrait ? 15.0 : 12.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ),
            )),
        Positioned(
            top: orientation == Orientation.portrait ? 20 : 20,
            right: orientation == Orientation.portrait ? 10 : 15,
            child: Align(
              child: SizedBox(
                width: orientation == Orientation.portrait
                    ? screenWidth / 9.142
                    : screenWidth / 24.2938, // 45 : 35
                height: orientation == Orientation.portrait
                    ? screenWidth / 13.7142 // 30
                    : screenWidth / 24.2938,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize:
                          orientation == Orientation.portrait ? 15.0 : 12.0,
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined)),
                ),
              ),
            )),
      ],
    );
  }

  Widget _containerForPotraitStackFoodInfo(
      double screenWidth,
      Orientation orientation,
      double paddingSize,
      double landscapepaddingSize) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: double.infinity,
      height: orientation == Orientation.portrait
          ? screenWidth - 160
          : screenWidth - 720,
      child: _buildPortraitStackForFoodInfo(
          context, orientation, screenWidth, paddingSize, landscapepaddingSize),
    );
  }

  Widget _buildFoodDescription(Orientation orientation, double paddingSize,
      double landscapepaddingSize) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(left: paddingSize, right: paddingSize)
          : EdgeInsets.only(
              left: landscapepaddingSize, right: landscapepaddingSize),
      //color: Colors.amber,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          widget.foods.name,
          style: headerStyle.copyWith(fontSize: 20),
        ),
        Text(
          'Rs ${widget.foods.price}',
          style: infoStyleText,
        )
      ]),
    );
  }

  Widget _buildFoodDetails(
    Orientation orientation,
    double paddingSize,
    double landscapepaddingSize,
  ) {
    return Container(
      //color: Colors.black12,
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(left: paddingSize, right: paddingSize)
          : EdgeInsets.only(
              left: landscapepaddingSize, right: landscapepaddingSize),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Details',
          style: infoStyle.copyWith(fontSize: 18),
        ),
        CounterButton(
            progressColor: prmColor,
            countColor: prmColor,
            count: _counterValue,
            buttonColor: txtColor,
            onChange: (int value) {
              setState(() {
                startLoading();
                _counterValue = value;
              });
            },
            loading: isLoading)
      ]),
    );
  }

  Widget _buildFoodText(double paddingSize, double landscapepaddingSize,
      Orientation orientation, double screenWidth) {
    return Container(
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(left: paddingSize, right: paddingSize)
          : EdgeInsets.only(
              left: landscapepaddingSize, right: landscapepaddingSize),
      //color: Colors.amber,
      child: RichText(
        softWrap: true,
        strutStyle: const StrutStyle(
          height: 1.8,
        ),
        maxLines: orientation == Orientation.portrait
            ? 15
            : 5, // Adjust maxLines as needed
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: widget.foods.description,
          style: infoStyleText.copyWith(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientsText(Orientation orientation, double paddingSize,
      double landscapepaddingSize) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(left: paddingSize, right: paddingSize)
          : EdgeInsets.only(
              left: landscapepaddingSize, right: landscapepaddingSize),
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Ingredients",
            style: headerStyle.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.foods.ingredients,
            style: infoStyleText.copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartButton(
      double paddingSize, double screenWidth, Orientation orientation) {
    return GestureDetector(
      onTap: () {
        print('Added To Cart');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: paddingSize),
        decoration: BoxDecoration(
            color: prmColor, borderRadius: BorderRadius.circular(12)),
        height: orientation == Orientation.portrait
            ? screenWidth / 8.6
            : screenWidth / 18.64,
        child: Center(
            child: Text(
          'Add To Cart',
          style: infoStyle.copyWith(color: bgColor),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double landscapepaddingSize = screenWidth * 0.005;
    double paddingSize = screenWidth * 0.04;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: orientation == Orientation.portrait
            ? Column(
                children: [
                  _containerForPotraitStackFoodInfo(screenWidth, orientation,
                      paddingSize, landscapepaddingSize),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildFoodDescription(
                      orientation, paddingSize, landscapepaddingSize),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFoodDetails(
                      orientation, paddingSize, landscapepaddingSize),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildFoodText(paddingSize, landscapepaddingSize, orientation,
                      screenWidth),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildIngredientsText(
                      orientation, paddingSize, landscapepaddingSize),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCartButton(paddingSize, screenWidth, orientation)
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _containerForPotraitStackFoodInfo(screenWidth, orientation,
                        paddingSize, landscapepaddingSize),
                    const SizedBox(
                      height: 5,
                    ),
                    _buildFoodDescription(
                        orientation, paddingSize, landscapepaddingSize),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildFoodDetails(
                        orientation, paddingSize, landscapepaddingSize),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildFoodText(paddingSize, landscapepaddingSize,
                        orientation, screenWidth),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildIngredientsText(
                        orientation, paddingSize, landscapepaddingSize),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildCartButton(paddingSize, screenWidth, orientation),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ));
  }
}
