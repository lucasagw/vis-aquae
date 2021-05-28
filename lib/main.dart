import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register/register_residence_screen1.dart';
import 'package:vis_aquae/residence/register/register_residence_screen2.dart';
import 'package:vis_aquae/residence/register/register_residence_screen3.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 684),
      builder: () => MaterialApp(
        title: 'Vis-Aquae',
        //debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          );
        },
        home: HomeScreen(),
        routes: {
          AppRoutes.registerResidence1: (context) => RegisterResidenceScreen1(),
          AppRoutes.registerResidence2: (context) => RegisterResidenceScreen2(),
          AppRoutes.registerResidence3: (context) => RegisterResidenceScreen3(),
        },
      ),
    );
  }
}
