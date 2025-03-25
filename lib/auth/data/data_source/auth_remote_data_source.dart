import 'dart:developer';

import 'package:flower_app/auth/domain/entity/sign_in_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/api_client.dart';
import '../../domain/entity/sign_up_request.dart';
import '../model/forget_response_password_dto.dart';
import '../model/reset_password_dto.dart';
import '../model/sign_up_response_dto.dart';
import '../model/verify_email_response_dto.dart';
import 'auth_remote_data_source.dart' as _apiClient;

abstract class AuthRemoteDataSource {
  Future<SignUpResponseDTO> signUp(SignUpRequest data);
  Future<HttpResponse<SignUpResponseDTO>> signIn(SignInRequest data);
  Future<ForgetResponsePasswordDto> forgetPassword(String email);
   Future<VerifyEmailResponseDto> verifyEmail(String code);
  Future<ResetPasswordResponseDTO> resetPassword(String email,String newPassword);

}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<SignUpResponseDTO> signUp(SignUpRequest data) async {
    log("Sign-up request data: ${data.toJson()}");
    return await _apiClient.signUp(data);
  }

  @override
  Future<ForgetResponsePasswordDto> forgetPassword(String email) async {
    log("Forget: $email");
    return await _apiClient.forgetPassword({"email": email}
    );

  }
  @override
  Future<VerifyEmailResponseDto> verifyEmail(String code) async {
    return await
    _apiClient.verifyEmail ({"resetCode": code});
  }

  @override
  Future<ResetPasswordResponseDTO> resetPassword(String email, String newPassword)async {
    log("Resetting password for :$email");
    return await _apiClient.resetPassword({
      "email":email,
      "newPassword":newPassword
    });
  }

  @override
  Future<HttpResponse<SignUpResponseDTO>> signIn(SignInRequest data) async {
    return await _apiClient.signIn(data);
  }

}


