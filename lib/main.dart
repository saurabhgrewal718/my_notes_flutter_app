import 'package:my_notes_app/pages/idea_form_container.dart';

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
        Idea_form_container.routeName: (ctx) => Idea_form_container(),

      },
      onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx) => HomePage(),);
      },
    );
  }
}