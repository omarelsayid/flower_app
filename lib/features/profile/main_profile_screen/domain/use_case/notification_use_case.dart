import 'package:flower_app/features/profile/main_profile_screen/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/get_all_notification_response_entity.dart';
import '../entity/get_notification_details_entity.dart';
@injectable
class NotificationUseCase {
  final NotificationRepository _repository;

  NotificationUseCase(this._repository);

  Future<Result<GetAllNotificationResponseEntity>> getAllNotification() =>
      _repository.getAllNotification();

  Future<Result<GetNotificationDetailsEntity>> getNotificationDetails(
    String notificationId,
  ) => _repository.getNotificationDetails(notificationId);

  Future<Result<GetNotificationDetailsEntity>> deleteNotification(
    String notificationId,
  ) => _repository.deleteNotification(notificationId);
}
