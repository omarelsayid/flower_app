import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/data_source/notification_remote_data_source.dart';

import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';

import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_notification_details_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/notification_repository.dart';
@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _dataSource;

  NotificationRepositoryImpl(this._dataSource);
  @override
  Future<Result<GetAllNotificationResponseEntity>> getAllNotification() {
    return _dataSource.getAllNotification();
  }

  @override
  Future<Result<GetNotificationDetailsEntity>> getNotificationDetails(String notificationId) {
  return _dataSource.getNotificationDetails(notificationId);
  }

  @override
  Future<Result<GetNotificationDetailsEntity>> deleteNotification(String notificationId) {
   return _dataSource.deleteNotification(notificationId);
  }
}