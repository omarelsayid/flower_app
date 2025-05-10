import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_notification_details_entity.dart';

abstract class NotificationRepository {
  Future<Result<GetAllNotificationResponseEntity>> getAllNotification();
  Future<Result<GetNotificationDetailsEntity>> getNotificationDetails(String notificationId);
  Future<Result<GetNotificationDetailsEntity>> deleteNotification(String notificationId);
}