import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MedicineScreen extends StatefulWidget {
  static const routeName = '/med-screen';
  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Data"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Data().getMedicineData(),
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
                          subtitle: Text("Location: ${supData['state']}"),
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5.0,
                          ),
                          expandedCrossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "ContactNo: ${supData['contact']}\n",
                              textAlign: TextAlign.left,
                            ),
                            Text("Status: ${supData['status']}\n"),
                            Text("Availability: ${supData['types']}\n"),
                            Text("Link: ${supData['link']}\n"),
                            Text("City: ${supData['city']}\n"),
                            Text("Last Updated: ${supData['lastUpdate']}\n"),
                            Text("Additional Info: ${supData['addInfo']}\n")
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
