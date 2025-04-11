import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';

class EditProfileUseCase {
  final ProfileRepository _profileRepository;

  EditProfileUseCase(this._profileRepository);

  Future<void> execute(EditProfileRequest data) async {
    await _profileRepository.editProfile(data);
  }
}