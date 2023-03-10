import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meddico/Screen/HomeScreen/homescreen.dart';
import 'package:meddico/Screen/Medicine/medicine.dart';
import 'package:meddico/Screen/Profile/profile.dart';
import 'package:meddico/Screen/bottomnav.dart';
import 'package:meddico/Screen/LoginPage/LoginPage.dart';
import 'package:meddico/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Bottomnav(),
      routes: {
        "/": (context) => LoginPage(),
        "/bottom":(context) => Bottomnav(),
        "/home": (context) => Homescreen(),
        "/medicine": (context) => Medicine(),
      },
      initialRoute: "/bottom",
    );
  }
}
