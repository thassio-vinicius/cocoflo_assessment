import 'package:cocoflo_assessment/models/geoposition.dart';

class Location {
  String city;
  String country;
  Position position;

  Location({this.city, this.country, this.position});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.position != null) {
      data['position'] = this.position.toJson();
    }
    return data;
  }
}
