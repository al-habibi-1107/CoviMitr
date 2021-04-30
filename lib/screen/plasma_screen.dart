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
                return Center(child: CircularProgressIndicator());
              } else {
                Response resOxy = oxySnapshot.data;
                List oxyData = jsonDecode(resOxy.body);

                return SafeArea(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var supData = oxyData[index];
                      return Container(
                        height: deviceSize.height * 0.25,
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
                        margin: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10.0),
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
                              Text("Status: ${supData['status']}"),
                              Text(
                                  "Last Verified Date: ${supData['lastUpdate']}"),
                              Text(
                                  "Additional Info: ${supData['additionalInfo']}"),
                              Text("Additional Link: ${supData['link']}"),
                              SizedBox(
                                height: deviceSize.height * 0.005,
                              ),
                              Divider(
                                color: Color.fromRGBO(71, 20, 61, 0.5),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
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
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
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
                                ],
                              ),
                            ],
                          ),
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Plasma Data"),
    //     elevation: 0.0,
    //   ),
    // body: FutureBuilder(
    //     future: Data().getPlasmaData(),
    //     builder: (context, oxySnapshot) {
    //       if (oxySnapshot.hasError) {
    //         return Text("Getting Data...");
    //       } else {
    //         if (oxySnapshot.connectionState == ConnectionState.waiting) {
    //           return Center(child: CircularProgressIndicator());
    //         } else {
    //           Response resOxy = oxySnapshot.data;
    //           List oxyData = jsonDecode(resOxy.body);

    //             return SafeArea(
    //               child: ListView.builder(
    //                 itemBuilder: (context, index) {
    //                   var supData = oxyData[index];
    //                   return Card(
    //                     margin: EdgeInsets.symmetric(
    //                         horizontal: 18.0, vertical: 10.0),
    //                     elevation: 2.0,
    //                     child: ExpansionTile(
    //                       title: Text(
    //                         "Name: ${supData['name']}\n",
    //                       ),
    //                       subtitle: Text("Location: ${supData['city']}"),
    //                       childrenPadding: EdgeInsets.symmetric(
    //                         horizontal: 18,
    //                         vertical: 5.0,
    //                       ),
    //                       expandedCrossAxisAlignment:
    //                           CrossAxisAlignment.stretch,
    //                       children: [
    //                         Text(
    //                           "ContactNo: ${supData['phoneNo']}\n",
    //                           textAlign: TextAlign.left,
    //                         ),
    //                         Text("Status: ${supData['status']}\n"),
    //                         Text(
    //                             "Last Verified Date: ${supData['lastUpdate']}"),
    //                         Text(
    //                             "Additional Info: ${supData['additionalInfo']}"),
    //                         Text("Additional Link: ${supData['link']}")
    //                       ],
    //                     ),
    //                   );
    //                 },
    //                 itemCount: oxyData.length,
    //               ),
    //             );
    //           }
    //         }
    //       }),
    // );
  }
}
