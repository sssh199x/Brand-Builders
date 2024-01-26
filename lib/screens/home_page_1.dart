import 'package:flutter/material.dart';
import 'package:ordering_app/res/constants.dart';
import 'package:ordering_app/screens/searchbox_header_1.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prmColor,
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 237, 236, 236),
        //Colors.white.withOpacity(0.8),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              BuisnessSearchBoxHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
