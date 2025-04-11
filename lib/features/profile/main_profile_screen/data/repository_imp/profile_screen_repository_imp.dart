import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_response_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/result.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(this._profileRemoteDataSource);

  @override
  Future<Result<ProfileResponseEntity>> getProfileData() async {
    return executeApi(() async {
      var data = await _profileRemoteDataSource.getProfileData();
      return data;
    });
  }

  @override
  Future<Result<EditProfileResponseEntity>> editProfile(
    EditProfileRequest data,
  ) async {
    return await executeApi(() async {
      EditProfileResponseDTO response = await _profileRemoteDataSource
          .editProfile(data);
      return response.user!.toEntity();
    });
  }
}
