import 'package:covimitr/screen/about.dart';
import 'package:covimitr/screen/medicine_screen.dart';
import 'package:covimitr/screen/oxygen_screen.dart';
import 'package:covimitr/screen/plasma_screen.dart';
import 'package:covimitr/screen/testing_screen.dart';

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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     "CoviMitr",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   elevation: 0,
      // ),
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
              height: deviceSize.height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: deviceSize.width * 0.1,
                ),
                Text(
                  "CoviMitr",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                ),
                SizedBox(
                  width: deviceSize.width * 0.3,
                ),
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
            Row(
              children: [
                SizedBox(
                  width: deviceSize.width * 0.1,
                  height: 10,
                ),
                Text(
                  "Together We Can..!!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0.0),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(OxygenScreen.routeName);
                },
                child: Container(
                  height: deviceSize.height * 0.1,
                  width: deviceSize.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(185, 151, 80, 1),
                      width: 0.75,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(185, 151, 80, 0.3),
                  ),
                  margin: EdgeInsets.all(18.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Oxygen Requirements",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
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
                child: Container(
                  height: deviceSize.height * 0.1,
                  width: deviceSize.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(185, 151, 80, 1),
                        width: 0.75,
                      ),
                      color: Color.fromRGBO(185, 151, 80, 0.3),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(18.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Medicine Requirements",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
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
                child: Container(
                  height: deviceSize.height * 0.1,
                  width: deviceSize.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(185, 151, 80, 1),
                        width: 0.75,
                      ),
                      color: Color.fromRGBO(185, 151, 80, 0.3),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(18.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Plasma Requirements",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
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
                child: Container(
                  height: deviceSize.height * 0.1,
                  width: deviceSize.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(185, 151, 80, 1),
                        width: 0.75,
                      ),
                      color: Color.fromRGBO(185, 151, 80, 0.3),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(18.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Testing Requirements",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
