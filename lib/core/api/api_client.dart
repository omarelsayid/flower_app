import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_app/features/data/model/sign_up_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/data/model/forget_response_password_dto.dart';
import '../../features/data/model/reset_password_dto.dart';
import '../../features/data/model/verify_email_response_dto.dart';
import '../../features/domain/entity/sign_up_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com")
@singleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signup")
  Future<SignUpResponseDTO> signUp(@Body() SignUpRequest data);
  @POST("/api/v1/auth/forgotPassword")
  Future<ForgetResponsePasswordDto> forgetPassword(@Body() Map<String,dynamic> data);

  @POST("/api/v1/auth/verifyResetCode")
  Future<VerifyEmailResponseDto> verifyEmail(@Body() Map<String,String> code);

  
  @PUT("/api/v1/auth/resetPassword")
  Future<ResetPasswordResponseDTO> resetPassword(@Body() Map<String, dynamic> data);
}

