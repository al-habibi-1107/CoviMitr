import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:covimitr/services/data.dart';

class OxygenScreen extends StatefulWidget {
  static const routeName = '/oxy-data';
  @override
  _OxygenScreenState createState() => _OxygenScreenState();
}

class _OxygenScreenState extends State<OxygenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oxygen Data"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Data().getOxyData(),
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
                            Text("Status: ${supData['currentStatus']}\n"),
                            Text("Last Updated: ${supData['lastUpdate']}")
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
