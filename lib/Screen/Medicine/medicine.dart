import 'package:flutter/material.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text(
          'Medicine'
        ),
      ),

    );
  }
}
