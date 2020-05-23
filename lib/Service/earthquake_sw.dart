import 'package:http/http.dart' as http;
import 'package:turkey_earthquake/models/earthquake.dart';
import 'dart:async';
import 'dart:convert';
import 'package:turkey_earthquake/models/eqresponse.dart';
import 'package:turkey_earthquake/models/filter.dart';
import '../logger.dart';

class EarthQuakeService {
  static final String _eqApiUrl =
      "https://api.orhanaydogdu.com.tr/deprem/live.php";

  static int _timeout = 10;
  static Future<List<EarthQuake>> GetEQList(List<Filter> fItems) async {
    EqResponse eqResponse = EqResponse();
    try {
      var sr = await http.get(_eqApiUrl).timeout(Duration(seconds: _timeout));
      if (sr.statusCode == 200) {
        if (fItems != null && fItems.length > 0) {
          eqResponse =
              EqResponse.fromJsonWithFilter(json.decode(sr.body), fItems);
        } else {
          eqResponse = EqResponse.fromJson(json.decode(sr.body));
        }
        return eqResponse.result;
      } else {
        throw Exception("Baglanamadık ${sr.statusCode}");
      }
    } catch (e, s) {
      Logger.recordError(e, s,
          "Exception occured when tring to get earthquake data from api.");
      throw e;
    }
  }
}
