import "earthquake.dart";
import 'filter.dart';

class EqResponse {
  bool status;
  List<EarthQuake> result;

  EqResponse({this.status, this.result});

  EqResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = new List<EarthQuake>();
      json['result'].forEach((v) {
        result.add(new EarthQuake.fromJson(v));
      });
    }
  }

  EqResponse.fromJsonWithFilter(
      Map<String, dynamic> json, List<Filter> fItems) {
    status = json['status'];
    if (json['result'] != null) {
      result = new List<EarthQuake>();
      json['result'].forEach((v) {
        EarthQuake eq = EarthQuake.fromJson(v);

        fItems.forEach((f) {
          if (eq.mag <= f.endValue && eq.mag >= f.startValue) {
            result.add(eq);
          }
        });
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
