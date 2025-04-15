import 'dart:io';
import 'dart:io';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:mime/mime.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_response_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retrofit/dio.dart';
import 'package:http_parser/http_parser.dart'; // for MediaType

import '../../../../../core/api/api_client.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponseDTO> getProfileData();
  Future<void> logout();
  Future<EditProfileResponseDTO> editProfile(Map<String, dynamic> data);
  Future<Result<String?>> uploadPhoto(File photo);
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileResponseDTO> getProfileData() async {
    var token=  SharedPreferenceServices.getData(AppConstants.token.toString());
    return await _apiClient.getProfileData("Bearer $token");
  }

  @override
  Future<EditProfileResponseDTO> editProfile(Map<String, dynamic> data) async {
    HttpResponse<EditProfileResponseDTO> response = await _apiClient
        .editProfile(data);
    return response.data;
  }
  @override
  Future<void> logout() async {
    await _apiClient.logout();
  }

  @override
  Future<Result<String?>> uploadPhoto(File photo) async {
    return await executeApi<String?>(() async {
      final mimeType = lookupMimeType(photo.path);
      var formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          photo.path,
          filename:
          'upload_${DateTime.now().millisecondsSinceEpoch}.${photo.path.split('.').last}',
          contentType: MediaType.parse(mimeType!),
        ),
      });
      final token =
      SharedPreferenceServices.getData(AppConstants.token) as String;
      var response = await _apiClient.uploadPhoto('Bearer $token', formData);
      return response;
    });
  }
}





