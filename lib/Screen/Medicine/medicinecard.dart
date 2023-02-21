import 'package:flutter/material.dart';
import 'package:meddico/Models/medicine_type.dart';

class MedicineCard extends StatelessWidget {
  final MedicineType pillType;
  final Function handler;
  const MedicineCard(this.pillType,this.handler);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => handler(pillType),
          child: Container(
            height: 40,
            width: 41,
            margin: EdgeInsets.only(right: 9, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: pillType.isChoose ? Colors.cyanAccent : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 5.0,),
            Container(width:50,height: 50.0,child: pillType.image),
            ]
          ),
        )
        )
      ],
    );
  }
}
