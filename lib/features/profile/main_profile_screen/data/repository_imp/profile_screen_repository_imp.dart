import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/result.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(this._profileRemoteDataSource,);

  @override
  Future<Result<ProfileResponseEntity>> getProfileData() async {
    return executeApi(
          () async {
        var data = await _profileRemoteDataSource.getProfileData();
        return data;
      },
    );
  }

  @override
  Future<Result<void>> logout() async {
    return executeApi<void>(
          () async {
        await _profileRemoteDataSource.logout();
      },
    );
  }




}
