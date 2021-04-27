import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier {
  final List<Map> oxyData = [];

  Future getOxyData() async {
    try {
      var data = await http.get(Uri.https(
        "script.google.com",
        "/macros/s/AKfycbxeS_vSxWnVUgbox6N0cIB0bJ4PCC-2WzHBTYpRZ_V037MURKQWxENVvkC4BWy02NZ9nw/exec",
      ));

      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
