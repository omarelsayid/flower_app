import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_addresses_dto.g.dart';

@JsonSerializable()
class UserAddressesDTO extends UserAddressesEntity {
  @JsonKey(name: 'addresses')
  final List<AddressDTO>? address;

  UserAddressesDTO({String? message, this.address})
    : super(
        message: message,
        addresses: address?.map((e) => e.toEntity()).toList(),
      );

  factory UserAddressesDTO.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressesDTOToJson(this);
}

@JsonSerializable()
class AddressDTO {
  @JsonKey(name: '_id')
  final String? id;
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;

  AddressDTO({
    this.id,
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'street': street,
      'phone': phone,
      'city': city,
      'lat': lat,
      'long': long,
      'username': username,
    };
    return data;
  }

  Address toEntity() {
    return Address(
      id: id,
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username,
    );
  }

  factory AddressDTO.fromEntity(Address entity) {
    return AddressDTO(
      id: entity.id,
      street: entity.street,
      phone: entity.phone,
      city: entity.city,
      lat: entity.lat,
      long: entity.long,
      username: entity.username,
    );
  }
  AddressDTO copyWith({
    String? id,
    String? street,
    String? phone,
    String? city,
    String? lat,
    String? long,
    String? username,
  }) {
    return AddressDTO(
      id: id ?? this.id,
      street: street ?? this.street,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      username: username ?? this.username,
    );
  }
}
