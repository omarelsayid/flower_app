import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';

sealed class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {
  final EditProfileResponseEntity data;
  EditProfileSuccessState({required this.data});
}

class EditProfileErrorState extends EditProfileState {
  final String message;
  EditProfileErrorState(this.message);
}
