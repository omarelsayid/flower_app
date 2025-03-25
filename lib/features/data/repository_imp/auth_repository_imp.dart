import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/data_source/auth_remote_data_source.dart';
import '../../../auth/domain/common/result.dart';
import '../../../auth/domain/entity/sign_up_request.dart';
import '../../../auth/domain/entity/sign_up_response_entity.dart';
import '../../domain/repository/auth_repository.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<User>> signUp(SignUpRequest data) async {
    try {
      //0000000000000
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

  @override
  Future<Result<ForgetResponsePasswordDto>> forgetPassword(String email) async {
    try {
      final ForgetResponsePasswordDto response = await _authRemoteDataSource.forgetPassword(email);
      log('SignUp Response: $response');
      log('Response Message: ${response.message}');
      log('Response info: ${response.info}');
   //   log('Response info: ${response.code}');

   //   var response = await _authRemoteDataSource.forgetPassword(email);

      // التأكد من أن الاستجابة تحتوي على بيانات صحيحة
      if (response.message == "success" && response.info != null) {
      //  await SharedPreferenceServices.saveData(AppConstants.token, response.message!);
        return Success(response);
      } else {
        log(' failed, response message: ${response.message}');
        return Error(response.message ?? "Unknown error");
      }
    } on DioException catch (dioException) {
      log("Dio Exception: ${dioException.response?.data}");
      return Error(dioException.response?.data["message"] ?? "Unknown error");
    } catch (e) {
      log("Unexpected error: $e");
      return Error("Unexpted error: $e");
    }
  }



  @override
  Future<Result<VerifyEmailResponseEntity>> verifyEmail(String code) async {
    {
      try {
        final VerifyEmailResponseEntity response = await _authRemoteDataSource.verifyEmail(code);
        log('SignUp Response: $response');
        log('Response status: ${response.status}');

        //   var response = await _authRemoteDataSource.forgetPassword(email);

        // التأكد من أن الاستجابة تحتوي على بيانات صحيحة
        if (response.status == "Success" ) {
          //  await SharedPreferenceServices.saveData(AppConstants.token, response.message!);
          return Success(response );
        } else {
          log(' failed, response message: ${response.status}');
          return Error( "Unknown error");
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


  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(String email, String newPassword) async {
    try {
      final resetResponse = await _authRemoteDataSource.resetPassword(email, newPassword);
      log('ResetPassword Response: $resetResponse');
      if (resetResponse.message == "success" && resetResponse.token != null) {
        await SharedPreferenceServices.saveData(AppConstants.token, resetResponse.token!);
        final entity = ResetPasswordResponseEntity(
          message: resetResponse.message!,
          token: resetResponse.token!,
        );
        return Success(entity);
      } else {
        return Error(resetResponse.error ?? "Unknown error");
      }
    } on DioException catch (dioException) {
      return Error(dioException.response?.data["error"] ?? "Unknown error");
    } catch (e) {
      return Error("Unexpected error: $e");
    }
  }

}
