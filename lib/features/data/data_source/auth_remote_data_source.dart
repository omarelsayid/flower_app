import 'dart:developer';

import 'package:injectable/injectable.dart';
import '../../../core/api/api_client.dart';
import '../../domain/entity/sign_up_request.dart';
import '../model/sign_up_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpResponseDTO> signUp(SignUpRequest data);
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
}


