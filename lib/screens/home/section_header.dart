import 'package:flutter/material.dart';

import '../../res/constants.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.headerText,
      required this.viewText,
      required this.viewWidth,
      required this.onViewClick});

  final String headerText, viewText;
  final double viewWidth;
  final VoidCallback onViewClick;

  Widget _buildRowWithInkWell() {
    return SizedBox(
      height: 20,
      width: viewWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: onViewClick,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                viewText,
                style: viewStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        textDirection: TextDirection.ltr,
        alignment: WrapAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              headerText,
              style: headerStyle,
            ),
          ),
          _buildRowWithInkWell()
        ],
      ),
    );
  }
}
