import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PlasmaScreen extends StatefulWidget {
  static const routeName = '/plasma-screen';
  @override
  _PlasmaScreenState createState() => _PlasmaScreenState();
}

class _PlasmaScreenState extends State<PlasmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plasma Data"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Data().getPlasmaData(),
          builder: (context, oxySnapshot) {
            if (oxySnapshot.hasError) {
              return Text("Getting Data...");
            } else {
              if (oxySnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                Response resOxy = oxySnapshot.data;
                List oxyData = jsonDecode(resOxy.body);

                return SafeArea(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var supData = oxyData[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10.0),
                        elevation: 2.0,
                        child: ExpansionTile(
                          title: Text(
                            "Name: ${supData['name']}\n",
                          ),
                          subtitle: Text("Location: ${supData['city']}"),
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5.0,
                          ),
                          expandedCrossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "ContactNo: ${supData['phoneNo']}\n",
                              textAlign: TextAlign.left,
                            ),
                            Text("Status: ${supData['status']}\n"),
                            Text(
                                "Last Verified Date: ${supData['lastUpdate']}"),
                            Text(
                                "Additional Info: ${supData['additionalInfo']}"),
                            Text("Additional Link: ${supData['link']}")
                          ],
                        ),
                      );
                    },
                    itemCount: oxyData.length,
                  ),
                );
              }
            }
          }),
    );
  }
}
