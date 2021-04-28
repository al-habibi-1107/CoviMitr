import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TestingScreen extends StatefulWidget {
  static const routeName = '/testing-screen';
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Data"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Data().getTestingData(),
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
                          subtitle: Text("Location: ${supData['location']}"),
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5.0,
                          ),
                          expandedCrossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "ContactNo: ${supData['contactNo']}\n",
                              textAlign: TextAlign.left,
                            ),
                            Text("Link: ${supData['link']}\n"),
                            Text("Email: ${supData['email']}\n"),
                            Text("Status: ${supData['status']}\n"),
                            Text("Last Updated: ${supData['lastVerified']}")
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
