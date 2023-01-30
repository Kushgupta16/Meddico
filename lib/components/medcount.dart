import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class Medcount extends StatefulWidget {
  const Medcount({Key? key}) : super(key: key);

  @override
  State<Medcount> createState() => _MedcountState();
}

class _MedcountState extends State<Medcount> {
  int simpleIntInput = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
          QuantityInput(
            buttonColor: Colors.cyan,
          value: simpleIntInput,
          onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', '')))
      ),
        // Text(
        //     'Value: $simpleIntInput',
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold
        //     )
        // ),
        ]
      ),
    );
  }
}
