import '../../../domain/entity/forget_response_password_entity.dart';

sealed class ForgetPasswordState {}

class LoadingForgetPasswordState extends ForgetPasswordState {}

class SuccessForgetPasswordState extends ForgetPasswordState {
  final ForgetResponsePasswordEntity? forgetPassword;
  SuccessForgetPasswordState(this.forgetPassword);
}

class ErrorForgetPasswordState extends ForgetPasswordState {
  final String? errorMessage;
  ErrorForgetPasswordState(this.errorMessage);
}
