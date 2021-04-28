import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier {
  final List<Map> oxyData = [];

  Future getOxyData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbxAZlsVWiyrkFL1Zt94JMvmvSjgXZaS_FdeuglHWAWEoZ9Mtcg7yAYzapcNgIaNCMqnOw/exec",
      ));
      if (data.statusCode == 200) {
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getPlasmaData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbwgGHnbUTLQGZ85qiUgz-cCXTP9DpNFa7GPSz2weMcCgA3Ab3_gtMFi3OisNMeFl12f/exec",
      ));

      if (data.statusCode == 200) {
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getMedicineData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbx4V8T9fjr3jMUJD-1NrsmhfFmPoItdqtVU98LRC2AWSZAkl3YKy4TNQ9x6bHwPppEVqA/exec",
      ));

      if (data.statusCode == 200) {
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
