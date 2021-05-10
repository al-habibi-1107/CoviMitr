import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class PlasmaScreen extends StatefulWidget {
  static const routeName = '/plasma-screen';
  @override
  _PlasmaScreenState createState() => _PlasmaScreenState();
}

class _PlasmaScreenState extends State<PlasmaScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 20, 61, 0.9),
        title: Text("Plasma Donors"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Data().getPlasmaData(),
          builder: (context, oxySnapshot) {
            if (oxySnapshot.hasError) {
              return Text("Getting Data...");
            } else {
              if (oxySnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitFoldingCube(
                  color: Color.fromRGBO(71, 20, 61, 0.9),
                  size: 30,
                ));
              } else {
                Response resOxy = oxySnapshot.data;
                List oxyData = jsonDecode(resOxy.body);

                return SafeArea(
                  child: deviceSize.width > 1200
                      ? GridView.builder(
                          gridDelegate: deviceSize.width > 1200
                              ? SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3)
                              : SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, childAspectRatio: 2.5),
                          itemBuilder: (context, index) {
                            var supData = oxyData[index];
                            return HelpCard(
                              supData: supData,
                              deviceSize: deviceSize,
                            );
                          },
                          itemCount: oxyData.length,
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            var supData = oxyData[index];
                            return HelpCard(
                              supData: supData,
                              deviceSize: deviceSize,
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

class HelpCard extends StatelessWidget {
  final deviceSize;
  final supData;

  HelpCard({this.deviceSize, this.supData});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: deviceSize.height * 0.25,
      width: deviceSize.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 0.5,
          )
        ],
        border: Border.all(
          color: Colors.white,
          width: 0.75,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${supData['name']}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            supData['status'] == ''
                ? Container()
                : Text("Status: ${supData['status']}"),
            supData['lastUpdate'] == ''
                ? Container()
                : Text("Last Verified Date: ${supData['lastUpdate']}"),
            supData['additionalInfo'] == ''
                ? Container()
                : Text("Additional Info: ${supData['additionalInfo']}"),
            supData['link'] == ''
                ? Container()
                : Text("Additional Link: ${supData['link']}"),
            SizedBox(
              height: deviceSize.height * 0.005,
            ),
            Divider(
              color: Color.fromRGBO(71, 20, 61, 0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceSize.height * 0.005,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: Color.fromRGBO(71, 20, 61, 1),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.005,
                      ),
                      Container(
                        width: deviceSize.width * 0.5,
                        child: Center(
                          child: supData['city'] == ""
                              ? Text('Not Availaible')
                              : Text(
                                  "${supData['city']}",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontSize: 12),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceSize.height * 0.005,
                      ),
                      Icon(
                        Icons.phone_in_talk_outlined,
                        color: Color.fromRGBO(71, 20, 61, 1),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.005,
                      ),
                      Container(
                        width: deviceSize.width * 0.3,
                        child: Center(
                          child: (supData['phoneNo'] == "")
                              ? Text('Not Availaible')
                              : Text(
                                  "${supData['phoneNo']}",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
