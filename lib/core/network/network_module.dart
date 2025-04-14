import 'package:dio/dio.dart';
import 'package:flower_app/core/network/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

import '../api/api_client.dart';
import '../services/shared_preference_services.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio();
    dio.interceptors.add(authInterceptor);
    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
// @module
// abstract class AppModule {
//   @lazySingleton
//   SharedPreferenceServices get sharedPreferenceServices => SharedPreferenceServices();
// }
