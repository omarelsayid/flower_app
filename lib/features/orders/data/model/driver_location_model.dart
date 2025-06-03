import 'package:cloud_firestore/cloud_firestore.dart';

import 'driver_location_model.dart' as location;

class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Driver {
  Location location;
  DateTime creaditAt;

  Driver({required this.location, required this.creaditAt});

  Driver.fromJson(Map<String, dynamic> json)
      : location = Location.fromJson(json['location']),
        creaditAt = (json['creaditAt'] as Timestamp).toDate();
}
