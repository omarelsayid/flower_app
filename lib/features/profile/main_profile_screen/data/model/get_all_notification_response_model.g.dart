// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationResponseModel _$GetAllNotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllNotificationResponseModel(
      message: json['message'] as String?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) =>
              NotificationsResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllNotificationResponseModelToJson(
        GetAllNotificationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'notifications': instance.notifications,
    };

NotificationsResponseModel _$NotificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponseModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      v: (json['__v'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$NotificationsResponseModelToJson(
        NotificationsResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt?.toIso8601String(),
      '_id': instance.id,
      '__v': instance.v,
    };
