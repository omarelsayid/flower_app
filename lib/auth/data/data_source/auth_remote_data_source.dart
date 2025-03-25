import 'dart:developer';

import 'package:flower_app/auth/domain/entity/sign_in_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/api_client.dart';
import '../../domain/entity/sign_up_request.dart';
import '../model/sign_up_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpResponseDTO> signUp(SignUpRequest data);
  Future<HttpResponse<SignUpResponseDTO>> signIn(SignInRequest data);
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
  Future<HttpResponse<SignUpResponseDTO>> signIn(SignInRequest data) async {
    return await _apiClient.signIn(data);
  }
}
