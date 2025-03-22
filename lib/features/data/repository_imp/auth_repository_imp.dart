import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/shared_preference_services.dart';
import '../../../core/utils/constant_manager.dart';
import '../../domain/common/result.dart';
import '../../domain/entity/sign_up_request.dart';
import '../../domain/entity/sign_up_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/sign_up_response_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<User>> signUp(SignUpRequest data) async {
    try {
      final SignUpResponseDTO response = await _authRemoteDataSource.signUp(data);

      // Log the response from the API
      log('SignUp Response: $response');
      log('Response Message: ${response.message}');
      log('Response Token: ${response.token}');
      log('Response User: ${response.user}');

      if (response.message == "success" && response.token != null && response.user != null) {
        await SharedPreferenceServices.saveData(AppConstants.token, response.token!);
        return Success(response.user!);
      } else {
        log('Sign-up failed, response message: ${response.message}');
        return Error(response.message ?? "Unknown error");
      }
    } on DioException catch (dioException) {
      log("Dio Exception: ${dioException.response?.data}");
      return Error(dioException.response?.data["message"] ?? "Unknown error");
    } catch (e) {
      log("Unexpected error: $e");
      return Error("Unexpected error: $e");
    }
  }
}
