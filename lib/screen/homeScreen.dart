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
        ),
        // body: Center(
        //   child: TextButton(
        //       onPressed: () async {
        //         await Data().getOxyData();
        //       },
        //       child: Text("Get Data")),
        // ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OxygenScreen.routeName);
                },
                child: Text("Oxygen Requirements"))
          ],
        ));
  }
}
