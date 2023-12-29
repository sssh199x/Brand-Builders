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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        textDirection: TextDirection.ltr,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            headerText,
            style: headerStyle,
          ),
          SizedBox(
            height: 20,
            width: viewWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onViewClick,
                  child: Text(
                    viewText,
                    style: viewStyle,
                  ),
                ),
                // InkWell(
                //     onTap: onViewClick,
                //     child: const Icon(
                //       Icons.keyboard_arrow_right,
                //       color: prmColor,
                //     )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
