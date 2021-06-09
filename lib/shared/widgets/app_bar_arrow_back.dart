import 'package:flutter/material.dart';

class AppBarArrowBack extends StatelessWidget {
  const AppBarArrowBack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
