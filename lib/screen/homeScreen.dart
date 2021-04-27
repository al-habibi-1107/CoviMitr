import 'dart:convert';

import 'package:covimitr/screen/oxygen_screen.dart';
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
        title: Text("Help Users"),
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
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
