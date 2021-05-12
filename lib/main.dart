import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes_app/pages/idea.dart';

import './pages/home.dart';
import './themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: HomePage(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        Idea.routeName: (ctx) => Idea(),

      },
      onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx) => HomePage(),);
      },
    );
  }
}