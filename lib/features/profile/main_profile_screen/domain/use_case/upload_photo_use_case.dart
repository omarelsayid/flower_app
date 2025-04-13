import 'dart:io';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  final ProfileRepository _profileRepository;

  UploadPhotoUseCase(this._profileRepository);

  Future<Result<dynamic>> execute(File photo, String description) async {
    return await _profileRepository.uploadPhoto(photo, description);
  }
}
