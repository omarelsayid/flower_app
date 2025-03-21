import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_app/features/data/model/sign_up_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/domain/entity/sign_up_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com")
@singleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signup")
  Future<SignUpResponseDTO> signUp(@Body() SignUpRequest data);
}

class DioLogger {
  static void addLoggingInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log("➡️ Request: ${options.method} ${options.uri}");
        log("➡️ Headers: ${options.headers}");
        log("➡️ Data: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log("✅ Response: ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        log("❌ Dio Error: ${e.response?.statusCode} ${e.response?.data}");
        return handler.next(e);
      },
    ));
  }
}
