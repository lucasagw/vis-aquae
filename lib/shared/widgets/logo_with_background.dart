import 'package:flutter/material.dart';
import 'package:vis_aquae/core/app_colors.dart';
import 'package:vis_aquae/core/core.dart';

class LogoWithBackgound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          100,
        ),
        border: Border.all(
          color: AppColors.iconLogoBorder,
          width: 5,
        ),
      ),
      child: Container(
        width: 113,
        height: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            100,
          ),
          color: AppColors.iconLogoBackgroun,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                ),
              ],
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            child: Image.asset(
              AppImages.logoIcon,
              width: 72,
              height: 89,
            ),
          ),
        ),
      ),
    );
  }
}
