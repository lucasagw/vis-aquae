import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyle {
  static final appSideBar = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.sideBarButton,
    ),
  );
}
