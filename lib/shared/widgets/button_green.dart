import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';

class ButtonGreen extends StatelessWidget {
  final String label;
  final Function onPressed;

  const ButtonGreen({
    Key key,
    @required this.onPressed,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green[700],
            ),
            child: Text(label),
          ),
          onPressed: onPressed,
          style: AppButtonStyles.appButtonGreen,
        ),
      ],
    );
  }
}
