import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';

class SideBarIcons extends StatefulWidget {
  @override
  _SideBarIconsState createState() => _SideBarIconsState();
}

class _SideBarIconsState extends State<SideBarIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.sideBackgroundBlackLight,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: AppColors.sideBarButton,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    AppImages.graficIcon,
                    width: 35,
                    height: 30,
                  ),
                  color: AppColors.sideBarButton,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    AppImages.waterIcon,
                    width: 35,
                    height: 30,
                  ),
                  color: AppColors.sideBarButton,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    AppImages.energyIcon,
                    width: 35,
                    height: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
