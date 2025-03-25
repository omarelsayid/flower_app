import '../../domain/entity/sign_up_response_entity.dart';

sealed class SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SuccessSignUpState extends SignUpState {
  final User? success;
  SuccessSignUpState(this.success);
}

class ErrorSignUpState extends SignUpState {
  final String? errMessage;

  ErrorSignUpState(this.errMessage);
}
class SignUpGenderChangedState extends SignUpState {
  final String gender;
  SignUpGenderChangedState(this.gender);
}
