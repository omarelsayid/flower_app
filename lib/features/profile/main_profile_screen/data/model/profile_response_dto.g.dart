// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseDTO _$ProfileResponseDTOFromJson(Map<String, dynamic> json) =>
    ProfileResponseDTO(
      message: json['message'] as String?,
      user:
          json['user'] == null
              ? null
              : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseDTOToJson(ProfileResponseDTO instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
  id: json['_id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  email: json['email'] as String?,
  addresses: json['addresses'] as List<dynamic>?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  wishlist: json['wishlist'] as List<dynamic>?,
);

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'wishlist': instance.wishlist,
  'addresses': instance.addresses,
  '_id': instance.id,
};
