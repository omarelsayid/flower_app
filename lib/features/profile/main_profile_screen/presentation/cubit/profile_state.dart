
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';

sealed class ProfileState {}

class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final UserEntity? user;
  SuccessProfileState(this.user,);
}

class ErrorProfileState extends ProfileState {
  final String message;
  ErrorProfileState(this.message);
}

