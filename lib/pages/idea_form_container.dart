import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './idea.dart';
import 'package:get/get.dart';
import '../themes.dart';


class Idea_form_container extends StatefulWidget {
  static const routeName = '/idea';

  @override
  _Idea_form_containerState createState() => _Idea_form_containerState();
}

class _Idea_form_containerState extends State<Idea_form_container> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Get.isDarkMode ? Colors.white : Colors.black45,),
        ),
        title: Text(
            "Add Your Idea",
            style: headingTextStyle,
          ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height+70,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Column(
              //   children: <Widget>[
              //     Text("Sign up", style: TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold
              //     ),),
              //     SizedBox(height: 20,),
              //     Text("Create an account, It's free", style: TextStyle(
              //       fontSize: 15,
              //       color: Colors.grey[700]
              //     ),),
              //   ],
              // ),
              Idea(),             
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}