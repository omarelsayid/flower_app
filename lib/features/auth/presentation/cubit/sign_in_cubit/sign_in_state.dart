import 'package:flower_app/features/auth/domain/entity/sign_up_response_entity.dart';

sealed class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final SignUpResponseEntity data;
  SignInSuccessState(this.data);
}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}
