// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_addresses_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressesDTO _$UserAddressesDTOFromJson(Map<String, dynamic> json) =>
    UserAddressesDTO(
      message: json['message'] as String?,
      address:
          (json['addresses'] as List<dynamic>?)
              ?.map((e) => AddressDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$UserAddressesDTOToJson(UserAddressesDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addresses': instance.address,
    };

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
  id: json['_id'] as String?,
  street: json['street'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.username,
    };
