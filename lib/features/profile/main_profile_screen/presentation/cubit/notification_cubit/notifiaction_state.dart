import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_notification_details_entity.dart';

sealed class NotificationState {}
class GetAllNotificationLoadingState extends NotificationState {}
class GetAllNotificationErrorState extends NotificationState {
  final String message;
  GetAllNotificationErrorState(this.message);
}
class GetAllNotificationSuccessState extends NotificationState {
  List<NotificationsResponseEntity> notificationsResponseEntity;
  GetAllNotificationSuccessState(this.notificationsResponseEntity);
}
class GetNotificationDetailsLoadingState extends NotificationState {}
class GetNotificationDetailsErrorState extends NotificationState {
  final String message;
  GetNotificationDetailsErrorState(this.message);
}
class GetNotificationDetailsSuccessState extends NotificationState {
  NotificationsDetailsEntity getNotificationDetailsEntity;
  GetNotificationDetailsSuccessState(this.getNotificationDetailsEntity);
}
class DeleteNotificationLoadingState extends NotificationState {}
class DeleteNotificationErrorState extends NotificationState {
  final String message;
  DeleteNotificationErrorState(this.message);
}
class DeleteNotificationSuccessState extends NotificationState {}