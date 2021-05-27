import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register_residence_screen.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vis-Aquae',
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        AppRoutes.registerResidence: (context) => RegisterResidenceScreen(),
      },
    );
  }
}
