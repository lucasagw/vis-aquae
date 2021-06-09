import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register/register_residence_screen1.dart';
import 'package:vis_aquae/residence/register/register_residence_screen2.dart';
import 'package:vis_aquae/residence/register/register_residence_screen3.dart';
import 'package:vis_aquae/residence/residence_screen.dart';
import 'package:vis_aquae/residence/residences_screen.dart';
import 'package:vis_aquae/residence/residences_viewmodel.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResidencesViewModel()),
      ],
      child: ScreenUtilInit(
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
          routes: {
            AppRoutes.homeScreen: (context) => HomeScreen(),
            AppRoutes.residencesScreen: (context) => ResidencesScreen(),
            AppRoutes.residenceScreen: (context) => ResidenceScreen(),
            AppRoutes.registerResidence1: (context) =>
                RegisterResidenceScreen1(),
            AppRoutes.registerResidence2: (context) =>
                RegisterResidenceScreen2(),
            AppRoutes.registerResidence3: (context) =>
                RegisterResidenceScreen3(),
          },
        ),
      ),
    );
  }
}
