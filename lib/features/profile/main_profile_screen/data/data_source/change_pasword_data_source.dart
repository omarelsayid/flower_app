import 'dart:developer';

import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/change_password_request_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/change_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';

abstract class ChangePasswordDataSource {
  Future<Result<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  );
}
@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImp implements ChangePasswordDataSource  {
 final ApiClient _apiClient;

  ChangePasswordDataSourceImp(this._apiClient);
  @override
  Future<Result<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async{
  var token=  SharedPreferenceServices.getData(AppConstants.token.toString());
    return executeApi(() async{
      var response = await _apiClient.changePassword(data,"Bearer $token");
      log("response ${response.message}");
      return response;
    },);
  }
}
