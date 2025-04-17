// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesResponseDTO _$AddressesResponseDTOFromJson(
        Map<String, dynamic> json) =>
    AddressesResponseDTO(
      message: json['message'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressesResponseDTOToJson(
        AddressesResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addresses': instance.addresses,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      username: json['username'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.username,
      '_id': instance.id,
    };
