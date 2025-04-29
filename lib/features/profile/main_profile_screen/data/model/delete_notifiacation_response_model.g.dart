// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_notifiacation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteNotificationResponseModel _$DeleteNotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteNotificationResponseModel(
      message: json['message'] as String?,
      notification: json['document'] == null
          ? null
          : DeleteNotificationsModel.fromJson(
              json['document'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$DeleteNotificationResponseModelToJson(
        DeleteNotificationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'document': instance.notification,
      'error': instance.error,
    };

DeleteNotificationsModel _$DeleteNotificationsModelFromJson(
        Map<String, dynamic> json) =>
    DeleteNotificationsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteNotificationsModelToJson(
        DeleteNotificationsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      '_id': instance.id,
      '__v': instance.v,
    };
