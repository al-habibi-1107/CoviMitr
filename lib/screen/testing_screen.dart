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
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 20, 61, 0.9),
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
                  child: GridView.builder(
                    gridDelegate: deviceSize.width > 1200
                        ? SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3)
                        : SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      var supData = oxyData[index];
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
                                        //width: deviceSize.width * 0.5,
                                        child: Center(
                                          child: (supData['location'] == null ||
                                                  supData['location'] == '')
                                              ? Text('Not Availaible')
                                              : Container(
                                                  width: (supData['location']
                                                                  .toString()
                                                                  .length >
                                                              20 &&
                                                          deviceSize.width <
                                                              1200)
                                                      ? deviceSize.width * 0.5
                                                      : 90,
                                                  child: Text(
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
                                        // width: deviceSize.width * 0.3,
                                        child: Center(
                                          child: (supData['contactNo'] ==
                                                      null ||
                                                  supData['contactNo'] == '')
                                              ? Text('Not Availaible')
                                              : Text(
                                                  "${supData['contactNo']}",
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
  }
}
