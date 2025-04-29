import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepository _profileRepository;

  EditProfileUseCase(this._profileRepository);

  Future<Result<EditProfileResponseEntity>> execute(
    Map<String, dynamic> data,
  ) async {
    return await _profileRepository.editProfile(data);
  }
}
