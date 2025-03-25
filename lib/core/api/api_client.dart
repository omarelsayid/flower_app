
import 'package:dio/dio.dart';
import 'package:flower_app/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/auth/domain/entity/sign_in_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../auth/domain/entity/sign_up_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com")
@singleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signup")
  Future<SignUpResponseDTO> signUp(@Body() SignUpRequest data);

  @POST("/api/v1/auth/signin")
  Future<HttpResponse<SignUpResponseDTO>> signIn(@Body() SignInRequest data);
}


