import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_client.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponseDTO> getProfileData();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;
  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileResponseDTO> getProfileData() async {
    return await _apiClient.getProfileData();
  }

}



