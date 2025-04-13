import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_response_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';

import '../../../../../core/api/api_client.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponseDTO> getProfileData();
  Future<EditProfileResponseDTO> editProfile(Map<String, dynamic> data);
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;
  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileResponseDTO> getProfileData() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<EditProfileResponseDTO> editProfile(Map<String, dynamic> data) async {
    HttpResponse<EditProfileResponseDTO> response = await _apiClient
        .editProfile(data);
    return response.data;
  }
}
