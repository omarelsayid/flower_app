import 'package:flower_app/features/auth/domain/entity/sign_up_response_entity.dart';

sealed class ProfileState {}

class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final User? user;
  SuccessProfileState(this.user,);
}

class ErrorProfileState extends ProfileState {
  final String message;
  ErrorProfileState(this.message);
}

