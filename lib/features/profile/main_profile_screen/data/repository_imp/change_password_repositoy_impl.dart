import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/data_source/change_pasword_data_source.dart';

import 'package:flower_app/features/profile/main_profile_screen/data/model/change_password_request_model.dart';

import 'package:flower_app/features/profile/main_profile_screen/domain/entity/change_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/reset_password_repository.dart';
@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImp implements ChangePasswordRepository {
  final ChangePasswordDataSource _changePasswordDataSource;

  ChangePasswordRepositoryImp(this._changePasswordDataSource);

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async{
    return await _changePasswordDataSource.changePassword(data);
  }
}
