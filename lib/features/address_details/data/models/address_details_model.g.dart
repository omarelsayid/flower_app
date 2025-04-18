// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetailsModel _$AddressDetailsModelFromJson(Map<String, dynamic> json) =>
    AddressDetailsModel(
      street: json['street'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    )
      ..userName = json['username'] as String?
      ..id = json['_id'] as String?;

Map<String, dynamic> _$AddressDetailsModelToJson(
        AddressDetailsModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.userName,
    };
