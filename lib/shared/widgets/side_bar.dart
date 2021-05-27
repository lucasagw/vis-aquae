import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      width: 190,
      decoration: BoxDecoration(
        color: AppColors.sideBackgroundBlack,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 160,
            decoration: BoxDecoration(
              color: AppColors.sideBackgroundBlackLight,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.registerResidence,
                      );
                    },
                    icon: Icon(Icons.menu, size: 40, color: Colors.white),
                    label: Text("MENU"),
                    style: AppButtonStyles.appSideBarStyleButton,
                  ),
                ),
                Container(
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.graficIcon,
                      width: 35,
                      height: 30,
                    ),
                    label: Text("GRÁFICO"),
                    style: AppButtonStyles.appSideBarStyleButton,
                  ),
                ),
                Container(
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.waterIcon,
                      width: 35,
                      height: 30,
                    ),
                    label: Text("ÁGUA"),
                    style: AppButtonStyles.appSideBarStyleButton,
                  ),
                ),
                Container(
                  width: 130,
                  child: ElevatedButton.icon(
                    icon: Image.asset(
                      AppImages.energyIcon,
                      width: 35,
                      height: 30,
                    ),
                    label: Text("ENERGIA"),
                    onPressed: () {},
                    style: AppButtonStyles.appSideBarStyleButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
