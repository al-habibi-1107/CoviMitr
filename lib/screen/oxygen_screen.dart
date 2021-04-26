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

                return ListView.builder(
                  itemBuilder: (context, index) {
                    var supData = oxyData[index];
                    return ExpansionTile(
                      title: Text("${supData['name']}"),
                      subtitle: Text("${supData['city']}"),
                      children: [
                        Text("${supData['phoneNo']}"),
                        Text("${supData['currentStatus']}"),
                        Text("${supData['lastUpdate']}")
                      ],
                    );
                  },
                  itemCount: oxyData.length,
                );
              }
            }
          }),
    );
  }
}
