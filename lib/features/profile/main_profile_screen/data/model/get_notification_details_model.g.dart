// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationDetailsModel _$GetNotificationDetailsModelFromJson(
        Map<String, dynamic> json) =>
    GetNotificationDetailsModel(
      message: json['message'] as String?,
      notification: json['notification'] == null
          ? null
          : NotificationsDetailsModel.fromJson(
              json['notification'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$GetNotificationDetailsModelToJson(
        GetNotificationDetailsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'notification': instance.notification,
      'error': instance.error,
    };

NotificationsDetailsModel _$NotificationsDetailsModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsDetailsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationsDetailsModelToJson(
        NotificationsDetailsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      '_id': instance.id,
      '__v': instance.v,
    };
