import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snackbar {
  void showSnack(String message, GlobalKey<ScaffoldState> _ScaffoldKey, Function undo) =>
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          action: undo != null ? SnackBarAction(
            textColor: Colors.black,
              label: "Undo",
              onPressed: () => undo,
          ):null,
        ),
      );
}