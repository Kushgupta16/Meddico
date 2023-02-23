import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddico/Screen/Medicine/platform_slider.dart';

class User_Slider extends StatelessWidget {
  final Function handler;
  final int howManyWeeks;
  User_Slider(this.handler,this.howManyWeeks);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
        child: PlatformSlider(
          value: howManyWeeks,
          divisions: 6,
          min: 1,
          max: 6,
          color: Colors.black,
          handler: this.handler,

        )),
      ],
    );
  }
}
