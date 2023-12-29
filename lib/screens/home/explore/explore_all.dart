import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'food_list.dart';

class ExploreAll extends StatelessWidget {
  const ExploreAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prmColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Explore', overflow: TextOverflow.ellipsis),
            DropDownCategory(isExploreAll: true)
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: ListViewBuild(viewAll: true),
      ),
    );
  }
}
