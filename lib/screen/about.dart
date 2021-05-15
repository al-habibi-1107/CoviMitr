import 'dart:ui';

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
          iconTheme: IconThemeData(color: Colors.deepPurple),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Team DevPro",
            style: GoogleFonts.calligraffitti(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            deviceSize.width > 800
                ? SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/image/Kamil.jpg"),
                            ),
                            Text(
                              "Kamil Anwar",
                              style: GoogleFonts.dancingScript(
                                //pacifico
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
                            Text(
                              "FLUTTER DEVELOPER",
                              style: GoogleFonts.sourceSansPro(
                                color: Colors.teal.shade100,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 2.5,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 150.0,
                              child: Divider(
                                  color: Colors.teal.shade50, thickness: 1.5),
                            ),
                            Container(
                              height: 60,
                              width: deviceSize.width * 0.25,
                              child: Card(
                                color: Colors.teal.shade100,
                                // margin: EdgeInsets.symmetric(
                                //     horizontal: deviceSize.width * 0.38,
                                //     vertical: 10.0),
                                child: ListTile(
                                  horizontalTitleGap: 0,
                                  leading: Icon(
                                    Icons.email_sharp,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "kamilanwar2001@gmail.com",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 100),
                            width: 1,
                            height: 200,
                            color: Colors.teal,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/image/IMG_3981.PNG"),
                            ),
                            Text(
                              "Aditya",
                              style: GoogleFonts.dancingScript(
                                //pacifico
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
                            Text(
                              "FLUTTER DEVELOPER",
                              style: GoogleFonts.sourceSansPro(
                                color: Colors.teal.shade100,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 2.5,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 150.0,
                              child: Divider(
                                  color: Colors.teal.shade50, thickness: 1.5),
                            ),
                            Container(
                              height: 60,
                              width: deviceSize.width * 0.25,
                              child: Card(
                                color: Colors.teal.shade100,
                                // margin: EdgeInsets.symmetric(
                                //     horizontal: deviceSize.width * 0.38,
                                //     vertical: 10.0),
                                child: ListTile(
                                  horizontalTitleGap: 0,
                                  leading: Icon(
                                    Icons.email_sharp,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "aditya.work2000@gmail.com",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("assets/image/Kamil.jpg"),
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
                          child: Divider(
                              color: Colors.teal.shade50, thickness: 1.5),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: deviceSize.width * 0.12,
                              vertical: 10.0),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.email_sharp,
                              color: Colors.teal,
                            ),
                            title: Text(
                              "kamilanwar2001@gmail.com",
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Divider(
                              color: Colors.teal.shade50, thickness: 1.0),
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage("assets/image/IMG_3981.PNG"),
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
                          child: Divider(
                              color: Colors.teal.shade50, thickness: 1.5),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: deviceSize.width * 0.12,
                              vertical: 10.0),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.email_sharp,
                              color: Colors.teal,
                            ),
                            title: Text(
                              "aditya.work2000@gmail.com",
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ]),
        ));
  }
}
