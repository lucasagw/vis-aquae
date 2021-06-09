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
      width: 210,
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
            width: 170,
            decoration: BoxDecoration(
              color: AppColors.sideBackgroundBlackLight,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.residencesScreen,
                      );
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: Text("RESIDÊNCIA"),
                    style: AppButtonStyles.appButtonDark,
                  ),
                ),
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.graficIcon,
                      width: 30,
                      height: 28,
                    ),
                    label: Text("GRÁFICO"),
                    style: AppButtonStyles.appButtonDark,
                  ),
                ),
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.waterIcon,
                      width: 30,
                      height: 28,
                    ),
                    label: Text("ÁGUA"),
                    style: AppButtonStyles.appButtonDark,
                  ),
                ),
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    icon: Image.asset(
                      AppImages.energyIcon,
                      width: 30,
                      height: 28,
                    ),
                    label: Text("ENERGIA"),
                    onPressed: () {},
                    style: AppButtonStyles.appButtonDark,
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
