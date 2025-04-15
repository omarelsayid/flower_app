// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseDTO _$ResetPasswordResponseDTOFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseDTO(
      message: json['message'] as String?,
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ResetPasswordResponseDTOToJson(
        ResetPasswordResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'error': instance.error,
    };
