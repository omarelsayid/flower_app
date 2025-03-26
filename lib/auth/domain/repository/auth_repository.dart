import 'package:flower_app/auth/domain/entity/forget_response_password_entity.dart';
import 'package:flower_app/auth/domain/entity/reset_password_response_entity.dart';
import 'package:flower_app/auth/domain/entity/verify_email_response_entity.dart';

import '../../../core/common/result.dart';
import '../entity/sign_in_request.dart';
import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
abstract class AuthRepository {
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequest data);
  Future<Result<SignUpResponseEntity>> signIn(SignInRequest data);
  Future<Result<ForgetResponsePasswordEntity>> forgetPassword(String email);
  Future<Result<VerifyEmailResponseEntity>> verifyEmail(String code);

  Future<Result<ResetPasswordResponseEntity>> resetPassword(String email, String newPassword);
}
