import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meddico/Screen/Medicine/medicine.dart';
import 'package:meddico/Screen/Profile/profile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Text('Text')
    );
  }
}
