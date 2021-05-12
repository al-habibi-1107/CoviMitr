import 'package:covimitr/screen/about.dart';
import 'package:covimitr/screen/medicine_screen.dart';
import 'package:covimitr/screen/oxygen_screen.dart';
import 'package:covimitr/screen/plasma_screen.dart';
import 'package:covimitr/screen/testing_screen.dart';
import '../shared/home_tile.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 451) {
          return Container();
        } else {
          return HomeMobileView(deviceSize: deviceSize);
        }
      },
    );
  }
}

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({
    Key key,
    @required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f7f9),
        elevation: 5,
        title: Text(
          'Covimitr',
          style: GoogleFonts.calligraffitti(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 2),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.purple,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(About.routeName);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tap cards to view',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: deviceSize.width * 0.50,
                    childAspectRatio: 0.95,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 0),
                children: [
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OxygenScreen.routeName);
                    },
                    text: "Oxygen",
                    deviceSize: deviceSize,
                    tileCol: Colors.purple.shade100,
                    imgAdr: "assets/image/O2.png",
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MedicineScreen.routeName);
                    },
                    text: "Medicine",
                    deviceSize: deviceSize,
                    tileCol: Colors.blue.shade100,
                    imgAdr: "assets/image/medicine.png",
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(TestingScreen.routeName);
                    },
                    text: "Testing",
                    deviceSize: deviceSize,
                    tileCol: Colors.green.shade100,
                    imgAdr: "assets/image/testing.png",
                  ),
                  HomeTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PlasmaScreen.routeName);
                    },
                    text: "Plasma",
                    deviceSize: deviceSize,
                    tileCol: Colors.teal.shade100,
                    imgAdr: "assets/image/plasma.png",
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: deviceSize.height * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.height * 0.01,
                    horizontal: deviceSize.width * 0.04),
                child: Text(
                  "DISCLAIMER: All of these resources provided on an “as and when basis” and “as in” based on a fact check done by volunteers who are dedicated to help individuals and families in such challenging times. By using these resources, you are agreeing that COVID FIGHTERS INDIA, however, do not accept any responsibility or liability for the accuracy, content, completeness, legality or reliability of the information contained in any of these.",
                  style: GoogleFonts.aBeeZee(
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
