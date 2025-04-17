import 'package:json_annotation/json_annotation.dart';

part 'addresses_response_dto.g.dart';

@JsonSerializable()
class AddressesResponseDTO {
  final String? message;
  final List<Address>? addresses;

  AddressesResponseDTO({this.message, this.addresses});

  factory AddressesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesResponseDTOToJson(this);
}

@JsonSerializable()
class Address {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  @JsonKey(name: '_id')
  final String? id;

  Address({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
