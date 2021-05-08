// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier {
  final List<Map> oxyData = [];

  Future getOxyData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbywZp-qcAowD3oI6h9x2jfPKIIJPBNrfy-Sn4oJW234_rrKCekPl_JMZtgPeMqDpSqc-g/exec",
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

  Future getTestingData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbxzCe8pkqHK1Gls7ZqJH3UYU7wT8fYcS5Clol2Ls98m25opaVyDJl9vVgkwCXOBqzQpxA/exec",
      ));

      if (data.statusCode == 200) {
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
