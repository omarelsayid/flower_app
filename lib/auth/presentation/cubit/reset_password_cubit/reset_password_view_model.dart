import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flower_app/auth/domain/entity/reset_password_response_entity.dart';
import 'package:flower_app/auth/domain/use_case/auth_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';

part 'reset_password_state.dart';
@injectable

class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordViewModel(this._authUseCase) : super(ResetPasswordInitial());

  final AuthUseCase _authUseCase;

  void resetPassword(String email, String newPassword) async {
    emit(ResetPasswordLoading());
    var result = await _authUseCase.callResetPassword(email, newPassword);
    switch (result) {
      case Success():
        if (result.data != null) {

          emit(ResetPasswordSuccess(result.data!));
        } else {
          emit(ResetPasswordError("Error"));
        }
        break;

      case Error():
        emit(ResetPasswordError(result.exception.toString()));
        break;
    }
  }
}
