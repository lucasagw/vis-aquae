import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';

class ContainerTitle extends StatelessWidget {
  final String title;

  const ContainerTitle({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.sideBackgroundBlackLight,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.iconLogoBorder,
        ),
        child: Text(
          title,
          style: AppTextStyle.headline6White(context),
        ),
      ),
    );
  }
}
