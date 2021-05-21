import 'package:flutter/material.dart';
import 'package:vis_aquae/core/app_colors.dart';
import 'package:vis_aquae/shared/widgets/logo_with_background.dart';
import 'package:vis_aquae/shared/widgets/side_bar_icons.dart';
import 'package:vis_aquae/shared/widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundScreen,
        child: Column(
          children: [
            SizedBox(height: 150),
            Container(
              alignment: Alignment.centerLeft,
              child: SideBar(),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWithBackgound(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
