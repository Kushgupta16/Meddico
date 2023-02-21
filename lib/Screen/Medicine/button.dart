import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function handler;
  final Widget buttonChild;
  final Color color;
  Button({required this.handler, required this.buttonChild, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: this.buttonChild,
        onPressed: () => handler,
      style: TextButton.styleFrom(
        elevation: 2,

      ),

      );
  }
}
