import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../domain/use_case/profile_screen_use_case.dart';
import '../../domain/entity/profile_response_entity.dart';
import '../cubit/profile_state.dart';
import '../../data/data_source/profile_local_data_source.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(this._profileUseCase, this._localDataSource)
    : super(LoadingProfileState());

  final ProfileUseCase _profileUseCase;
  final ProfileLocalDataSource _localDataSource;

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

    final token = await _localDataSource.getToken();

    // Guest Mode
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

    // Logged-in user
    final result = await _profileUseCase.execute();

    switch (result) {
      case Success():
        final profile = result.data;
        if(isClosed)
          {
            log("The Cubit is closed ");
            return;
          }
        if (profile != null) {
          emit(SuccessProfileState(profile.user));
          log("Fetched successfully: ${profile.user?.firstName}");
        } else {
          emit(ErrorProfileState("No user data found"));
        }
        break;

      case Error():
        emit(ErrorProfileState("Profile API Error: ${result.exception}"));
        log("Profile API Error: ${result.exception}");
        break;
    }
  }

  Future<void> _logout() async {
    emit(LoadingProfileState());

    final result = await _profileUseCase.callLogout();

    switch (result) {
      case Success():
        await _localDataSource.deleteToken();
        emit(LogoutSuccessState());
        log("User logged out successfully");
        break;

      case Error():
        emit(ErrorProfileState("Logout failed: ${result.exception}"));
        log("Logout error: ${result.exception}");
        break;
    }
  }
}

sealed class ProfileIntent {}

class ProfileClickedIntent extends ProfileIntent {}

class LogoutClickedIntent extends ProfileIntent {}
