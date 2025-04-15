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
  Future<EditProfileResponseDTO> editProfile(Map<String, dynamic> data);
  // Future<void> uploadPhoto();
  // Future<void> uploadImage();
  // Future<void> uploadPhoto9();
  // Future<String?> uploadimage(File photo);
  Future<Result<String?>> uploadPhoto(File photo);
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

  /// Upload photo using Dio
  // Future<void> uploadPhoto() async {
  //   try {
  //     final picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 85,
  //
  //     );
  //
  //     if (image == null) return;
  //
  //     // Verify the file is actually an image
  //     final mimeType = lookupMimeType(image.path);
  //     if (mimeType == null || !mimeType.startsWith('image/')) {
  //       print('Selected file is not an image');
  //       return;
  //     }
  //
  //
  //     final token = await SharedPreferenceServices.getData(AppConstants.token);
  //     if (token == null) {
  //       print('No authentication token found');
  //       return;
  //     }
  //
  //
  //     var formData = FormData.fromMap({
  //       'photo': await MultipartFile.fromFile(
  //         image.path,
  //         filename:
  //         'upload_${DateTime
  //             .now()
  //             .millisecondsSinceEpoch}.${image.path
  //             .split('.')
  //             .last}',
  //         contentType: MediaType.parse(mimeType),
  //       ),
  //     });
  //
  //
  //     Dio dio = Dio();
  //     dio.options.validateStatus = (status) => status! < 500;
  //
  //     var response = await dio.put(
  //       "https://flower.elevateegy.com/api/v1/auth/upload-photo",
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'multipart/form-data',
  //           'Accept': 'application/json',
  //         },
  //       ),
  //     );
  //
  //     // Handle response
  //     if (response.statusCode == 200) {
  //       print('Upload successful: ${response.data}');
  //     } else {
  //       print('Upload failed (${response.statusCode}): ${response.data}');
  //       if (response.data is Map && response.data['error'] == 'images only') {
  //         print('Server rejected the file - only image files are allowed');
  //       }
  //     }
  //   } on DioException catch (e) {
  //     print('Network error: ${e.message}');
  //     if (e.response != null) {
  //       print('Error details: ${e.response?.data}');
  //     }
  //   } catch (e) {
  //     print('Unexpected error: $e');
  //   }
  // }

  /// Upload photo using retrofit
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
