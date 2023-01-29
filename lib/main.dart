import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meddico/Screen/HomeScreen/homescreen.dart';
import 'package:meddico/Screen/Medicine/medicine.dart';
import 'package:meddico/Screen/Profile/profile.dart';
import 'package:meddico/Screen/bottomnav.dart';
import 'package:meddico/Screen/LoginPage/LoginPage.dart';
import 'package:meddico/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomnav(),
      // routes: {
      //   "/": (context) => LoginPage(),
      //   "/login": (context) => LoginPage(),
      // },
    );
  }
}
