import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';

class ButtonRegister extends StatelessWidget {
  final Function onPressed;

  const ButtonRegister({
    Key key,
    @required this.onPressed,
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
            child: Text('Registrar'),
          ),
          onPressed: onPressed,
          style: AppButtonStyles.appRegisterStyleButton,
        ),
      ],
    );
  }
}
