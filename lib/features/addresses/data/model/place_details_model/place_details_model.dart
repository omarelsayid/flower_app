import 'display_name.dart';
import 'location.dart';

class PlaceDetailsModel {
  String? id;
  String? formattedAddress;
  Location? location;
  DisplayName? displayName;

  PlaceDetailsModel({
    this.id,
    this.formattedAddress,
    this.location,
    this.displayName,
  });

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceDetailsModel(
      id: json['id'] as String?,
      formattedAddress: json['formattedAddress'] as String?,
      location:
          json['location'] == null
              ? null
              : Location.fromJson(json['location'] as Map<String, dynamic>),
      displayName:
          json['displayName'] == null
              ? null
              : DisplayName.fromJson(
                json['displayName'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'formattedAddress': formattedAddress,
    'location': location?.toJson(),
    'displayName': displayName?.toJson(),
  };
}
