import 'package:flutter/material.dart';

class AppInputDecoration {
  static InputDecoration inputDecoration({String labelText}) {
    return InputDecoration(
      focusColor: Colors.grey,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
