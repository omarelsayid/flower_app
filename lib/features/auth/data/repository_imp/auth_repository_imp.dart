import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_app/features/auth/data/model/forget_response_password_dto.dart';
import 'package:flower_app/features/auth/domain/entity/reset_password_response_entity.dart';
import 'package:flower_app/features/auth/domain/entity/verify_email_response_entity.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:retrofit/dio.dart';

import '../../../../core/common/result.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../domain/entity/sign_in_request.dart';
import '../../domain/entity/sign_up_request.dart';
import '../../domain/entity/sign_up_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/sign_up_response_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;

  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this.internetConnectionChecker,
  );

  @override
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequest data) async {
    // executeApi(
    //   () async{
    //     var result=await _authRemoteDataSource.signUp(data);
    //     var res=SignUpResponseDTO.fromJson(result.user!.toJson());
    //     return res;
    //   },
    // );
    try {
      final SignUpResponseDTO response = await _authRemoteDataSource.signUp(
        data,
      );

      // Log response
      log('SignUp Response: $response');
      log('Response Message: ${response.message}');
      log('Response Token: ${response.token}');
      log('Response User: ${response.user}');

      if (response.message == "success" &&
          response.token != null &&
          response.user != null) {
        return Success(response);
      } else {
        log('Sign-up failed, response message: ${response.message}');
        return Error(response.message ?? "Unknown error");
      }
    } on DioException catch (dioException) {
      log(
        "Dio Exception: ${dioException.response?.data}" +
            "++++++++++++++++++++++++++",
      );
      return Error(
        ServerFailure.fromDioException(dioException).errorMessage.toString(),
      );
    } catch (e) {
      log("Unexpected error: $e");
      return Error("Unexpected error: $e");
    }
  }

  @override
  Future<Result<SignUpResponseEntity>> signIn(SignInRequest data) async {
    try {
      bool isConnected = await internetConnectionChecker.hasConnection;
      if (isConnected) {
        final HttpResponse<SignUpResponseDTO> response =
            await _authRemoteDataSource.signIn(data);

        log('status code: ${response.response.statusCode}');

        if (response.response.statusCode! >= 200 &&
            response.response.statusCode! < 300) {
          // await SharedPreferenceServices.saveData(
          //   AppConstants.token,
          //   response.data.token!,
          // );
          log('status code: ${response.data.user!.email}');
          log('status code: ${response.data.user!.firstName}');
          log('status code: ${response.data.token}');
          log('success');
          return Success(response.data);
        } else {
          log('Error: ${response.response.data['error']}');
          return Error(
            ServerFailure.fromDioException(
              response.response.data['error'],
            ).errorMessage.toString(),
          );
        }
      } else {
        log('Please check your internet connection ad try again later');
        return Error(
          "Please check your internet connection and try again later",
        );
      }
    } on DioException catch (e) {
      log('error 1');

      log(
        'Error: ${ServerFailure.fromDioException(e).errorMessage.toString()}',
      );
      return Error(ServerFailure.fromDioException(e).errorMessage.toString());
    } catch (e) {
      log('error 2');

      log('Error: ${e.toString()}');
      return Error(
        ServerFailure(errorMessage: e.toString()).errorMessage.toString(),
      );
    }
  }

  @override
  Future<Result<ForgetResponsePasswordDto>> forgetPassword(String email) async {
    try {
      final ForgetResponsePasswordDto response = await _authRemoteDataSource
          .forgetPassword(email);
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
        final VerifyEmailResponseEntity response = await _authRemoteDataSource
            .verifyEmail(code);
        log('SignUp Response: $response');
        log('Response status: ${response.status}');

        //   var response = await _authRemoteDataSource.forgetPassword(email);

        // التأكد من أن الاستجابة تحتوي على بيانات صحيحة
        if (response.status == "Success") {
          //  await SharedPreferenceServices.saveData(AppConstants.token, response.message!);
          return Success(response);
        } else {
          log(' failed, response message: ${response.status}');
          return Error("Unknown error");
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
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final resetResponse = await _authRemoteDataSource.resetPassword(
        email,
        newPassword,
      );
      log('ResetPassword Response: $resetResponse');
      if (resetResponse.message == "success" && resetResponse.token != null) {
        await SharedPreferenceServices.saveData(
          AppConstants.token,
          resetResponse.token!,
        );
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
