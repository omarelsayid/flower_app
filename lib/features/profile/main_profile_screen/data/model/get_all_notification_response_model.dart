import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/get_all_notification_response_entity.dart';

part 'get_all_notification_response_model.g.dart';

@JsonSerializable()
class GetAllNotificationResponseModel extends GetAllNotificationResponseEntity {
  GetAllNotificationResponseModel({super.message, this.notifications});

  @JsonKey(name: 'notifications')
  final List<NotificationsResponseModel>? notifications;

  factory GetAllNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationResponseModelFromJson(json);
}

@JsonSerializable()
class NotificationsResponseModel extends NotificationsResponseEntity {
  NotificationsResponseModel({this.id, super.title, super.body, this.v,super.createdAt});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: '__v')
  final int? v;

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseModelFromJson(json);
}
