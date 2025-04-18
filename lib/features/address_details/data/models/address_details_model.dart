import 'package:json_annotation/json_annotation.dart';
part 'address_details_model.g.dart';

@JsonSerializable()
class AddressDetailsModel {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  @JsonKey(name: 'username')
  String? userName;
  @JsonKey(includeToJson: false, name: '_id')
  String? id;
  AddressDetailsModel({
    this.street,
    this.city,
    this.phone,
    this.lat,
    this.long,
  });

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailsModelToJson(this);
}
