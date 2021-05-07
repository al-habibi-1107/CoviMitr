import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class TestingScreen extends StatefulWidget {
  static const routeName = '/testing-screen';
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  String filterBy = '';
  bool isTru = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 20, 61, 0.9),
        title: Text("Testing Data"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          deviceSize.width > 1200
              ? Container()
              : Form(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
          Expanded(
            child: FutureBuilder(
                future: Data().getTestingData(),
                builder: (context, oxySnapshot) {
                  if (oxySnapshot.hasError) {
                    return Text("Getting Data...");
                  } else {
                    if (oxySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      Response resOxy = oxySnapshot.data;
                      List oxyData = jsonDecode(resOxy.body);

                      return SafeArea(
                        child: deviceSize.width > 1200
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, childAspectRatio: 3),
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

                                  if (filterBy != '') {
                                    if (supData['location']
                                        .toString()
                                        .toLowerCase()
                                        .contains(filterBy.toLowerCase())) {
                                      return HelpCard(
                                        supData: supData,
                                        deviceSize: deviceSize,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    return HelpCard(
                                      supData: supData,
                                      deviceSize: deviceSize,
                                    );
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

class HelpCard extends StatelessWidget {
  final deviceSize;
  final supData;

  HelpCard({this.deviceSize, this.supData});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: deviceSize.height * 0.35,
      //width: deviceSize.width,
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
            supData['link'] == ''
                ? Container()
                : Text("Link: ${supData['link']}"),
            supData['email'] == ''
                ? Container()
                : Text("Email: ${supData['email']}"),
            supData['status'] == ''
                ? Container()
                : Text("Status: ${supData['status']}"),
            Container(
                width: deviceSize.width * 0.8,
                child: supData['lastVerified'] == ''
                    ? Container()
                    : Text(
                        "Last Updated: ${supData['lastVerified']}",
                        overflow: TextOverflow.clip,
                      )),
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
                        //width: deviceSize.width * 0.5,
                        child: Center(
                          child: (supData['location'] == null ||
                                  supData['location'] == '')
                              ? Text('Not Availaible')
                              : Text(
                                  "${supData['location']}",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
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
                        // width: deviceSize.width * 0.3,

                        child: (supData['contactNo'] == null ||
                                supData['contactNo'] == '')
                            ? Text('Not Availaible')
                            : Text(
                                "${supData['contactNo']}",
                                style: TextStyle(
                                  fontSize: 12,
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
