import 'package:flutter/material.dart';

class TextResidenceCard extends StatelessWidget {
  final String text;
  const TextResidenceCard(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
