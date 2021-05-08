import 'package:covimitr/screen/about.dart';
import 'package:covimitr/screen/medicine_screen.dart';
import 'package:covimitr/screen/oxygen_screen.dart';
import 'package:covimitr/screen/plasma_screen.dart';
import 'package:covimitr/screen/testing_screen.dart';
import '../shared/home_tile.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(71, 20, 61, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "CoviMitr",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(About.routeName);
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: deviceSize.width > 1200
                    ? SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 3)
                    : SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: deviceSize.width * 0.4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20),
                children: [
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OxygenScreen.routeName);
                    },
                    text: "Oxygen Requirements",
                    deviceSize: deviceSize,
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MedicineScreen.routeName);
                    },
                    text: "Medicine Requirements",
                    deviceSize: deviceSize,
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(TestingScreen.routeName);
                    },
                    text: "Testing Requirements",
                    deviceSize: deviceSize,
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PlasmaScreen.routeName);
                    },
                    text: "Plasma Requirements",
                    deviceSize: deviceSize,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          margin: EdgeInsets.only(bottom: deviceSize.height * 0.03),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: deviceSize.height * 0.01,
                horizontal: deviceSize.width * 0.04),
            child: Text(
              "DISCLAIMER: All of these resources provided on an “as and when basis” and “as in” based on a fact check done by volunteers who are dedicated to help individuals and families in such challenging times. By using these resources, you are agreeing that COVID FIGHTERS INDIA, however, do not accept any responsibility or liability for the accuracy, content, completeness, legality or reliability of the information contained in any of these.",
              style: TextStyle(
                color: Colors.white70,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
//Color.fromRGBO(71, 20, 61, 1),
