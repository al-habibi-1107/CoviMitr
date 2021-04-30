import 'dart:convert';

import 'package:covimitr/services/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class MedicineScreen extends StatefulWidget {
  static const routeName = '/med-screen';
  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
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
                      DateTime strtDate = DateTime.parse(supData['lastUpdate']);
                      String updateDate = DateFormat.MMMEd().format(strtDate);
                      return Container(
                        //height: deviceSize.height * 0.325,
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
                                Text("Availability: ${supData['types']}"),
                                Text("Link: ${supData['link']}\n"),
                                Text("Additional Info: ${supData['addInfo']}"),
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
                                          width: deviceSize.width * 0.8,
                                          child: Center(
                                            child: Text(
                                              "${supData['city']}",
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
//for Phone Number
                                    // Column(
                                    //   children: [
                                    //     SizedBox(
                                    //       height: deviceSize.height * 0.005,
                                    //     ),
                                    //     Icon(
                                    //       Icons.phone_in_talk_outlined,
                                    //       color: Color.fromRGBO(71, 20, 61, 1),
                                    //     ),
                                    //     SizedBox(
                                    //       height: deviceSize.height * 0.005,
                                    //     ),
                                    //     Container(
                                    //       width: deviceSize.width * 0.3,
                                    //       child: Center(
                                    //         child: supData['contactNo'] == null
                                    //             ? Text('Not Availaible')
                                    //             : Text(
                                    //                 "${supData['contactNo']}",
                                    //                 style: TextStyle(
                                    //                   fontSize: 12,
                                    //                 ),
                                    //               ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
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
