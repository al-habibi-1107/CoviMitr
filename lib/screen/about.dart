import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  static const routeName = '/about-screen';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Team DevPro"),
      ),
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60,
              //backgroundImage: AssetImage("assets/image/IMG_3981.PNG"),
            ),
            Text(
              "Kamil Anwar",
              style: GoogleFonts.dancingScript(
                //pacifico
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: GoogleFonts.sourceSansPro(
                color: Colors.teal.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(color: Colors.teal.shade50, thickness: 1.5),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * 0.12, vertical: 10.0),
              child: ListTile(
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.email_sharp,
                  color: Colors.teal,
                ),
                title: Text(
                  "kamilanwar2001@gmail.com",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: Divider(color: Colors.teal.shade50, thickness: 1.0),
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/image/IMG_3981.PNG"),
            ),
            Text(
              "Aditya",
              style: GoogleFonts.dancingScript(
                //pacifico
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: GoogleFonts.sourceSansPro(
                color: Colors.teal.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(color: Colors.teal.shade50, thickness: 1.5),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * 0.12, vertical: 10.0),
              child: ListTile(
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.email_sharp,
                  color: Colors.teal,
                ),
                title: Text(
                  "aditya.work2000@gmail.com",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    color: Colors.teal,
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
