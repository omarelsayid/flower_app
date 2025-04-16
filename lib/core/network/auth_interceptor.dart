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

// class AuthInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // end points we do not add token.
//     final excludedPaths = [
//       "/api/v1/auth/login",
//       "/api/v1/auth/register",
//       "/api/v1/auth/verifyResetCode",
//       "/api/v1/auth/resetPassword",
//     ];
//
//     final needsAuth = !excludedPaths.contains(options.path);
//
//     if (needsAuth) {
//       final token = SharedPreferenceServices.getData(AppConstants.token);
//       if (token != null) {
//         options.headers["Authorization"] = "Bearer $token";
//       }
//     }
//
//     return handler.next(options);
//   }
// }
