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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        title: Text("Add New"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Title(
                 title: 'Medicine Name',
                 isRequired: true,
               ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(color: Colors.white)
            ),
            TextSpan(
              text: isRequired ? " *" : "",
              style: TextStyle(color: Colors.white)
            )
          ]
        )
      ),
    );
  }
}

