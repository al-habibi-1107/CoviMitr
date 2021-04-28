import 'dart:convert';

import 'package:covimitr/screen/medicine_screen.dart';
import 'package:covimitr/screen/oxygen_screen.dart';
import 'package:covimitr/screen/plasma_screen.dart';
import 'package:covimitr/screen/testing_screen.dart';
import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoviMitr"),
        elevation: 0,
      ),
      // body: Center(
      //   child: TextButton(
      //       onPressed: () async {
      //         await Data().getOxyData();
      //       },
      //       child: Text("Get Data")),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                "DISCLAIMER: All of these resources provided on an “as and when basis” and “as in” based on a fact check done by volunteers who are dedicated to help individuals and families in such challenging times. By using these resources, you are agreeing that COVID FIGHTERS INDIA, however, do not accept any responsibility or liability for the accuracy, content, completeness, legality or reliability of the information contained in any of these."),
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
                onPressed: () {
                  Navigator.of(context).pushNamed(OxygenScreen.routeName);
                },
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Oxygen Requirements",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
                onPressed: () {
                  Navigator.of(context).pushNamed(MedicineScreen.routeName);
                },
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Medicine Requirements",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
                onPressed: () {
                  Navigator.of(context).pushNamed(PlasmaScreen.routeName);
                },
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Plasma Requirements",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
                onPressed: () {
                  Navigator.of(context).pushNamed(TestingScreen.routeName);
                },
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Testing Requirements",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
