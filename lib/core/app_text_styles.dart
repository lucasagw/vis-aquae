import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle headline6White(BuildContext context) => TextStyle(
        fontSize: Theme.of(context).textTheme.headline6.fontSize,
        color: Colors.white,
      );
  static TextStyle headline6Dark(BuildContext context) => TextStyle(
        fontSize: Theme.of(context).textTheme.headline6.fontSize,
        color: Colors.black,
      );
}
