import 'dart:developer';

import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../../../core/services/shared_preference_services.dart';
import '../../../../../core/utils/constant_manager.dart';
import '../../domain/use_case/profile_screen_use_case.dart';


@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(this._profileUseCase) : super(LoadingProfileState());

  final ProfileUseCase _profileUseCase;

  void doIntent(ProfileIntent profileIntent) {
    switch (profileIntent) {
      case ProfileClickedIntent():
        _getProfile();
        break;

      case LogoutClickedIntent():
        _logout();
        break;
    }
  }

  Future<void> _getProfile() async {
    emit(LoadingProfileState());

    final tokenRaw = await SharedPreferenceServices.getData(AppConstants.token);
    final token = tokenRaw is String ? tokenRaw : null;// instead of use as String direct

    //as guest
    if (token == null || token.isEmpty) {
      final guestUser = UserEntity(
        firstName: 'Guest User',
        email: 'guest@gmail.com',
        photo: '',
      );
      emit(SuccessProfileState(guestUser));
      log("Guest mode: showing guest user");
      return;
    }

    // as user
    final result = await _profileUseCase.execute();

    switch (result) {
      case Success():
        final profile = result.data;
        if (profile != null) {
          emit(SuccessProfileState(profile.user));
          log("Fetched successfully: ${profile.user?.firstName}");
        } else {
          emit(ErrorProfileState(profile!.message.toString()));
        }
        break;

      case Error():
        emit(ErrorProfileState(result.exception.toString()));
        log("Profile API Error: ${result.exception}");
        break;
    }
  }

  Future<void> _logout() async {
    emit(LoadingProfileState());

    final result = await _profileUseCase.callLogout();

    switch (result) {
      case Success():
        await SharedPreferenceServices.deleteData(AppConstants.token);
        emit(LogoutSuccessState());
        log("User logged out successfully");
        break;

      case Error():
        emit(ErrorProfileState("Logout failed: ${result.exception.toString()}"));
        log("Logout error: ${result.exception}");
        break;
    }
  }

}

sealed class ProfileIntent {}

class ProfileClickedIntent extends ProfileIntent {}
class LogoutClickedIntent extends ProfileIntent {}

