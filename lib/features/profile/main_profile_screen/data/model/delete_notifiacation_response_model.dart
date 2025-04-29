import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/get_notification_details_entity.dart';

part 'delete_notifiacation_response_model.g.dart';

@JsonSerializable()
class DeleteNotificationResponseModel extends GetNotificationDetailsEntity {
  DeleteNotificationResponseModel({
    super.message,
    this.notification,
    this.error,
  });

  @JsonKey(name: 'document')
  final DeleteNotificationsModel? notification;
  @JsonKey(name: "error")
  final String? error;

  factory DeleteNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteNotificationResponseModelFromJson(json);
}

@JsonSerializable()
class DeleteNotificationsModel extends NotificationsDetailsEntity {
  DeleteNotificationsModel({this.id, super.title, super.body, this.v});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: '__v')
  final int? v;

  factory DeleteNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteNotificationsModelFromJson(json);
}
