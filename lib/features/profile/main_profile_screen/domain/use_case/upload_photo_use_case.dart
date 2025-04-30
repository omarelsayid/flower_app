import 'dart:io';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  final ProfileRepository _profileRepository;

  UploadPhotoUseCase(this._profileRepository);

  Future<Result<String?>> execute(File photo) async {
    return await _profileRepository.uploadPhoto(photo);
  }
}
