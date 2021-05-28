import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vis_aquae/core/app_colors.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: media.width,
        height: media.height,
        alignment: Alignment.center,
        color: AppColors.backgroundScreen,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Container(
                alignment: Alignment.centerLeft,
                child: SideBar(),
              ),
              SizedBox(height: 100.h),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
