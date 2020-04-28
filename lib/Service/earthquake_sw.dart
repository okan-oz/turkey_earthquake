import 'package:http/http.dart' as http;
import 'package:turkey_earthquake/models/earthquake.dart';
import 'dart:async';
import 'dart:convert';

import 'package:turkey_earthquake/models/eqresponse.dart';

class EarthQuakeService {
  static Future<List<EarthQuake>> GetEQList() async {
    var sr = await http.get("https://api.orhanaydogdu.com.tr/deprem/live.php");

    if (sr.statusCode == 200) {
      EqResponse eqResponse = EqResponse.fromJson(json.decode(sr.body));
      return eqResponse.
      result;
    } else {
      throw Exception("Baglanamadık ${sr.statusCode}");
    }
  }
}
