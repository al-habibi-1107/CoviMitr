import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class MedicineScreen extends StatefulWidget {
  static const routeName = '/med-screen';
  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  String filterBy = '';
  bool isTru = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 20, 61, 0.9),
        title: Text("Medicine Data"),
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
                          ),
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                            label: Container())
                      ],
                    ),
                  ),
                ),
          Expanded(
            child: FutureBuilder(
                future: Data().getMedicineData(),
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

                      return SafeArea(
                        child: deviceSize.width > 1200
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2.4),
                                itemBuilder: (context, index) {
                                  var supData = oxyData[index];
                                  String updateDate = 'NA';
                                  if (supData['lastUpdate'] != '') {
                                    DateTime strtDate =
                                        DateTime.parse(supData['lastUpdate']);
                                    updateDate =
                                        DateFormat.MMMEd().format(strtDate);
                                  }

                                  return CardCustom(
                                      supData, deviceSize, updateDate);
                                },
                                itemCount: oxyData.length,
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  var supData = oxyData[index];
                                  String updateDate = 'NA';
                                  if (supData['lastUpdate'] != '') {
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
                                      return CardCustom(
                                          supData, deviceSize, updateDate);
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    return CardCustom(
                                        supData, deviceSize, updateDate);
                                  }
                                },
                                itemCount: oxyData.length,
                              ),
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

class CardCustom extends StatelessWidget {
  final supData;
  final deviceSize;
  final updateDate;
  CardCustom(this.supData, this.deviceSize, this.updateDate);
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
              supData['types'].toString().length < 120
                  ? Text("Availability: ${supData['types']}")
                  : Text(
                      "Availability: ${supData['types']}",
                      style: TextStyle(fontSize: 5),
                    ),
              Text("Link: ${supData['link']}\n"),
              Text("Additional Info: ${supData['addInfo']}"),
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
                          child: Text(
                            "${supData['city']}",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12),
                            maxLines: 3,
                          ),
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
                          "${supData['contact']}",
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
