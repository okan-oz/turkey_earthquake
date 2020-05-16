import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:turkey_earthquake/models/earthquake.dart';
import 'dart:async';
import 'dart:convert';
import 'package:turkey_earthquake/models/eqresponse.dart';

class EarthQuakeService {
  static final String eqApiUrl =
      "https://api.orhanaydogdu.com.tr/deprem/live.php";
  static Future<List<EarthQuake>> GetEQList() async {
    EqResponse eqResponse=EqResponse();
    try {
      var sr = await http.get(eqApiUrl).timeout(Duration(seconds: 10));
      if (sr.statusCode == 200) {
          eqResponse = EqResponse.fromJson(json.decode(sr.body));
        return eqResponse.result;
      } else {
        throw Exception("Baglanamadık ${sr.statusCode}");
      }
    } catch (e, s) {
      Crashlytics.instance.recordError(e, s,
          context:
              'Exception occured when tring to get earthquake data from api.');

          //Crashlytics.instance.crash();
        throw e;
    }
  }
}
