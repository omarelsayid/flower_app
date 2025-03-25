import '../entity/forget_response_password_entity.dart';
import '../entity/reset_password_response_entity.dart';
import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
import '../common/result.dart';
import '../entity/verify_email_response_entity.dart';

abstract class AuthRepository {
  Future<Result<User>> signUp(SignUpRequest data);
  Future<Result<ForgetResponsePasswordEntity>> forgetPassword(String email);
  Future<Result<VerifyEmailResponseEntity>> verifyEmail(String code);

  Future<Result<ResetPasswordResponseEntity>> resetPassword(String email, String newPassword);

}
