import 'package:flower_app/features/profile/main_profile_screen/data/model/change_password_request_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/change_password_entity.dart';
@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository _changePasswordRepository;

  ChangePasswordUseCase(this._changePasswordRepository);

  Future<Result<ChangePasswordEntity>> execute(
    ChangePasswordRequestModel data,
  ) {
    return _changePasswordRepository.changePassword(data);
  }
}
