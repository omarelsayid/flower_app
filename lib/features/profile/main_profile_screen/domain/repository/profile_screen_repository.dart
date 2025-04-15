import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import '../../../../../core/common/result.dart';

abstract class ProfileRepository {
  Future<Result<ProfileResponseEntity>> getProfileData();
  Future<Result<void>> logout();

  Future<String?> getToken();
  Future<void> deleteToken();
}
