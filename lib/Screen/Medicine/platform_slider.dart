import 'dart:ui';
import 'package:flutter/material.dart';

class PlatformSlider extends StatelessWidget {
  final int min,max,divisions,value;
  final Function handler;
  final Color color;

  PlatformSlider(
  {
    required this.value,
    required this.handler,
    required this.color,
    required this.divisions,
    required this.max,
    required this.min,
});

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: this.value.toDouble(),
        onChanged: (value) => this.handler(value),
      max: this.max.toDouble(),
      min: this.min.toDouble(),
      divisions: this.divisions,
      activeColor: this.color,
    );
  }
}
