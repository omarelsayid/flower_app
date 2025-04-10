import 'package:dio/dio.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import '../utils/constant_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = SharedPreferenceServices.getData(AppConstants.token);
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }
}
