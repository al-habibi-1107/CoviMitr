import 'package:covimitr/screen/homeScreen.dart';
import 'package:covimitr/screen/medicine_screen.dart';
import 'package:covimitr/screen/oxygen_screen.dart';
import 'package:covimitr/screen/plasma_screen.dart';
import 'package:covimitr/screen/testing_screen.dart';
import 'package:flutter/material.dart';

import './screen/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.black)),
      home: HomeScreen(),
      routes: {
        OxygenScreen.routeName: (context) => OxygenScreen(),
        PlasmaScreen.routeName: (context) => PlasmaScreen(),
        MedicineScreen.routeName: (context) => MedicineScreen(),
        TestingScreen.routeName: (context) => TestingScreen()
      },
    );
  }
}
