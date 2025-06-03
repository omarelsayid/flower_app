class LocationInfo {
  final LatLngModel latLng;

  LocationInfo({required this.latLng});

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      latLng: LatLngModel.fromJson(json['location']['latLng']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': {
        'latLng': latLng.toJson(),
      }
    };
  }
}
class LatLngModel {
  final double latitude;
  final double longitude;

  LatLngModel({required this.latitude, required this.longitude});

  factory LatLngModel.fromJson(Map<String, dynamic> json) {
    return LatLngModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}