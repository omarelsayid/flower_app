import '../../domain/entity/sign_up_response_entity.dart';

sealed class SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SuccessSignUpState extends SignUpState {
  final User? success;
  final String token;

  SuccessSignUpState(this.success, this.token);
}


class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState(this.message);
}

class SignUpGenderChangedState extends SignUpState {
  final String gender;
  SignUpGenderChangedState(this.gender);
}
