import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:covimitr/services/data.dart';
import 'package:intl/intl.dart';

class OxygenScreen extends StatefulWidget {
  static const routeName = '/oxy-data';
  @override
  _OxygenScreenState createState() => _OxygenScreenState();
}

class _OxygenScreenState extends State<OxygenScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  String filterBy = '';
  bool isTru = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 20, 61, 0.9),
        title: Text("Oxygen Data"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          deviceSize.width > 1200
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
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
                  child: Form(
                    key: _key,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                            onChanged: (value) {
                              filterBy = value;
                            },
                            onEditingComplete: () {
                              setState(() {
                                if (filterBy != '') {
                                  isTru = true;
                                } else {
                                  isTru = false;
                                }
                              });
                            },
                            onSaved: (value) {
                              filterBy = value;
                              setState(() {
                                if (filterBy != '') {
                                  isTru = true;
                                } else {
                                  isTru = false;
                                }
                              });
                            },
                          ),
                        ),
                        TextButton.icon(
                            onPressed: () {
                              _key.currentState.save();
                            },
                            icon: Icon(Icons.search),
                            label: Container())
                      ],
                    ),
                  ),
                ),
          Expanded(
            child: FutureBuilder(
                future: Data().getOxyData(),
                builder: (context, oxySnapshot) {
                  if (oxySnapshot.hasError) {
                    return Text("Getting Data...");
                  } else {
                    if (oxySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                          child: SpinKitFoldingCube(
                        color: Color.fromRGBO(71, 20, 61, 0.9),
                        size: 30,
                      ));
                    } else {
                      Response resOxy = oxySnapshot.data;
                      List oxyData = jsonDecode(resOxy.body);

                      return deviceSize.width > 1200
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 2),
                              itemBuilder: (context, index) {
                                var supData = oxyData[index];
                                String updateDate = '';

                                if (supData['lastUpdate'].toString() != '') {
                                  DateTime strtDate =
                                      DateTime.parse(supData['lastUpdate']);
                                  updateDate =
                                      DateFormat.MMMEd().format(strtDate);
                                }
                                return HelpCard(
                                  supData: supData,
                                  updateDate: updateDate,
                                  deviceSize: deviceSize,
                                );
                              },
                              itemCount: oxyData.length,
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                var supData = oxyData[index];
                                String updateDate = '';

                                if (supData['lastUpdate'].toString() != '') {
                                  DateTime strtDate =
                                      DateTime.parse(supData['lastUpdate']);
                                  updateDate =
                                      DateFormat.MMMEd().format(strtDate);
                                }

                                if (filterBy != '') {
                                  if (supData['city']
                                      .toString()
                                      .toLowerCase()
                                      .contains(filterBy.toLowerCase())) {
                                    return HelpCard(
                                      id: index,
                                      supData: supData,
                                      updateDate: updateDate,
                                      deviceSize: deviceSize,
                                    );
                                  } else {
                                    return Container();
                                  }
                                } else {
                                  return HelpCard(
                                    id: index,
                                    supData: supData,
                                    updateDate: updateDate,
                                    deviceSize: deviceSize,
                                  );
                                }
                              },
                              itemCount: oxyData.length,
                            );
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class HelpCard extends StatelessWidget {
  final id;
  final deviceSize;
  final supData;
  final updateDate;

  HelpCard({this.id, this.deviceSize, this.supData, this.updateDate});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Card(
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
              Text("Last Updated: $updateDate"),
              Text("Status: ${supData['status']}"),
              Text("Address: ${supData['city']}"),
              supData['cylinder'].toString() == 'Not-Available'
                  ? Container()
                  : Text("Cylinders : ${supData['cylinder']}"),
              supData['cans'].toString() == 'Not-Available'
                  ? Container()
                  : Text("Cans: ${supData['cans']}"),
              supData['refill'].toString() == 'Not-Available'
                  ? Container()
                  : Text("Refills: ${supData['refill']}"),
              Text("Additional Info: ${supData['additionalInfo']}"),
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
                          height: deviceSize.height * 0.015,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          color: Color.fromRGBO(71, 20, 61, 1),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.005,
                        ),
                        Text(
                          "${supData['state']}",
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.015,
                        ),
                        Icon(
                          Icons.phone_in_talk_outlined,
                          color: Color.fromRGBO(71, 20, 61, 1),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.005,
                        ),
                        Text(
                          "${supData['phoneNo']}",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
