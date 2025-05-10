import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/get_notification_details_entity.dart';

part 'get_notification_details_model.g.dart';

@JsonSerializable()
class GetNotificationDetailsModel extends GetNotificationDetailsEntity {
  GetNotificationDetailsModel({super.message, this.notification,this.error});

  @JsonKey(name: 'notification')
  final NotificationsDetailsModel? notification;
@JsonKey(name:"error")
  final String? error;
  factory GetNotificationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationDetailsModelFromJson(json);
}

@JsonSerializable()
class NotificationsDetailsModel extends NotificationsDetailsEntity {
  NotificationsDetailsModel({this.id, super.title, super.body, this.v});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: '__v')
  final int? v;
  factory NotificationsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDetailsModelFromJson(json);
}
