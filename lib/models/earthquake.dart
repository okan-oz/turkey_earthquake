import 'package:turkey_earthquake/helper/utils.dart';

class EarthQuake {
  double mag;
  double lng;
  double lat;
  String lokasyon;
  double depth;
  List<double> coordinates;
  String title;
  String rev;
  int timestamp;
  String dateStamp;
  String date;
  String hash;
  String hash2;

  EarthQuake(
      {this.mag,
      this.lng,
      this.lat,
      this.lokasyon,
      this.depth,
      this.coordinates,
      this.title,
      this.rev,
      this.timestamp,
      this.dateStamp,
      this.date,
      this.hash,
      this.hash2});

  EarthQuake.fromJson(Map<String, dynamic> json) {
    mag = Utils.CheckDouble(json['mag'].toString());
    lng = Utils.CheckDouble(json['lng'].toString());
    lat = Utils.CheckDouble(json['lat'].toString());
    lokasyon = json['lokasyon'];
    depth = Utils.CheckDouble(json['depth'].toString());
    coordinates = json['coordinates'].cast<double>();
    title = json['title'];
    rev = json['rev'];
    timestamp = json['timestamp'];
    dateStamp = json['date_stamp'];
    date = json['date'];
    hash = json['hash'];
    hash2 = json['hash2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mag'] = this.mag;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['lokasyon'] = this.lokasyon;
    data['depth'] = this.depth;
    data['coordinates'] = this.coordinates;
    data['title'] = this.title;
    data['rev'] = this.rev;
    data['timestamp'] = this.timestamp;
    data['date_stamp'] = this.dateStamp;
    data['date'] = this.date;
    data['hash'] = this.hash;
    data['hash2'] = this.hash2;
    return data;
  }
}
