import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_notification_details_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/constant_manager.dart';

abstract class NotificationRemoteDataSource {
  Future<Result<GetAllNotificationResponseEntity>> getAllNotification();

  Future<Result<GetNotificationDetailsEntity>> getNotificationDetails(
    String notificationId,
  );

  Future<Result<GetNotificationDetailsEntity>> deleteNotification(
    String notificationId,
  );
}

@Injectable(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImp implements NotificationRemoteDataSource {
  final ApiClient _apiClient;

  NotificationRemoteDataSourceImp(this._apiClient);

  var token = SharedPreferenceServices.getData(AppConstants.token.toString());

  @override
  Future<Result<GetAllNotificationResponseEntity>> getAllNotification() {
    return executeApi(() async {
      return await _apiClient.getAllNotifications(
        "Bearer $token",
        "-createdAt",
      );
    });
  }

  @override
  Future<Result<GetNotificationDetailsEntity>> getNotificationDetails(
    String notificationId,
  ) async {
    return executeApi(() async {
      return await _apiClient.getNotificationDetails(
        "Bearer $token",
        notificationId,
      );
    });
  }

  @override
  Future<Result<GetNotificationDetailsEntity>> deleteNotification(
    String notificationId,
  ) {
    return executeApi(() {
      return _apiClient.deleteNotification("Bearer $token", notificationId);
    });
  }
}
