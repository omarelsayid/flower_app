// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      message: json['message'] as String?,
      error: json['error'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
  ChangePasswordModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'error': instance.error,
};
