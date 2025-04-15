// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseDTO _$SignUpResponseDTOFromJson(Map<String, dynamic> json) =>
    SignUpResponseDTO(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseDTOToJson(SignUpResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': SignUpResponseDTO._userToJson(instance.user),
    };

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      addresses: json['addresses'] as List<dynamic>?,
      gender: json['gender'] as String?,
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
      'id': instance.id,
      'addresses': instance.addresses,
    };
