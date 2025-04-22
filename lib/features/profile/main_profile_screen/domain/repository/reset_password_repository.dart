import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/change_password_request_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/change_password_entity.dart';

abstract class ChangePasswordRepository {
  Future<Result<ChangePasswordEntity>> changePassword(ChangePasswordRequestModel data);
}
