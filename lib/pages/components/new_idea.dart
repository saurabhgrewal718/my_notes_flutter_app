import 'package:flutter/material.dart';
import 'package:my_notes_app/pages/idea_form_container.dart';
import '../../size_config.dart';
import '../../themes.dart';
import '../idea.dart';

class New_Idea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(
        //   "Find Your",
        //   style: subHeadingTextStyle,
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Add Your Idea",
            style: headingTextStyle,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            iconSize: 25,
            color: Colors.green,
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