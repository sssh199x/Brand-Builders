import 'package:flutter/material.dart';
import 'package:ordering_app/screens/home/explore/explore_all.dart';
import 'package:ordering_app/provider/food_model.dart';
import 'package:provider/provider.dart';
import '../../../res/constants.dart';
import 'food_list.dart';

class ExploreFood extends StatefulWidget {
  const ExploreFood({super.key});

  @override
  State<ExploreFood> createState() => _ExploreFoodState();
}

class _ExploreFoodState extends State<ExploreFood> {
  bool isGrid = true;

  void _viewMore() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const ExploreAll())));
  }

  Widget _buildHeader() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          const FittedBox(
              fit: BoxFit.cover,
              child: Text('Explore More', style: headerStyle)),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.7482, //(i.e 235.3440)
            //183(previously),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    isGrid ? Icons.view_list : Icons.grid_on_rounded,
                  ),
                  onPressed: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const DropDownCategory(isExploreAll: false),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: _viewMore,
                  child: const Text('View All  >  ', style: viewStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 35,
      child: Consumer<FoodModel>(builder: (context, value, child) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.exploreItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 1, top: 1),
                child: GestureDetector(
                  onTap: () {
                    value.setSelectedItem(index);
                  },
                  child: Container(
                    width: 80,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: value.selectedItem == index
                            ? prmColor
                            : Colors.white,
                        border: Border.all(
                            color: value.selectedItem == index
                                ? Colors.transparent
                                : Colors.black87,
                            width: value.selectedItem == index ? 0 : 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        value.exploreItems[index],
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: value.selectedItem == index
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }

  Widget _buildFoodList() {
    return isGrid ? const GridViewBuild() : const ListViewBuild(viewAll: false);
  }

  Widget _buildViewAllButton() {
    return InkWell(
      onTap: _viewMore,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('View All', style: viewStyle),
          Icon(Icons.keyboard_arrow_down, color: prmColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildCategoryList(),
          const SizedBox(height: 16),
          _buildFoodList(),
          _buildViewAllButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
