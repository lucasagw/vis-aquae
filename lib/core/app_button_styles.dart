import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  static final appButtonDark = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.sideBarButton,
    ),
  );

  static final appButtonGreen = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.green[900],
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
