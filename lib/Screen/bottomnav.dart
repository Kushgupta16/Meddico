import 'package:flutter/material.dart';
import 'package:meddico/Screen/HomeScreen/homescreen.dart';
import 'package:meddico/Screen/Medicine/medicine.dart';
import 'package:meddico/Screen/Profile/profile.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int pageIndex=0;
  List<Widget> pageList = <Widget>[
  Homescreen(),
  Medicine(),
  Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.3),
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_sharp),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_sharp),label: "ADD"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
        )
    );
  }
}
