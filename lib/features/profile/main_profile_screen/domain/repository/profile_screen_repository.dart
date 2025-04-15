import 'dart:io';

import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import '../../../../../core/common/result.dart';

abstract class ProfileRepository {
  Future<Result<ProfileResponseEntity>> getProfileData();
  Future<Result<EditProfileResponseEntity>> editProfile(
    Map<String, dynamic> data,
  );
  Future<Result<String?>> uploadPhoto(File photo);
}
