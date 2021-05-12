import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_app/pages/idea_form_container.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../themes.dart';
import '../idea.dart';

class New_Idea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(
        //   "Find Your",
        //   style: subHeadingTextStyle,
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Add Your Idea",
            style: subHeadingTextStyle,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            iconSize: 30,
            color: Get.isDarkMode ? Colors.white : choclateColor,
            splashColor: Colors.purple,
            onPressed: () {
              Navigator.of(context).pushNamed(Idea_form_container.routeName);
            },
          )
        ])
      ]),
    );
  }
}