import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/edit_profile_use_case.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewModel extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  EditProfileViewModel(this._editProfileUseCase)
    : super(EditProfileInitialState());

  void editProfile(EditProfileRequest data) async {
    emit(EditProfileLoadingState());
    final result = await _editProfileUseCase.execute(data);
    switch (result) {
      case Success():
        emit(EditProfileSuccessState(data: result.data!));
        break;
      case Error():
        emit(EditProfileErrorState(result.exception!));
        break;
    }
  }
}
