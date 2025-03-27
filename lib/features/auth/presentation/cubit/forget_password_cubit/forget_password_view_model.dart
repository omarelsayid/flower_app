import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../../../core/services/shared_preference_services.dart';
import '../../../../../core/utils/constant_manager.dart';
import '../../../domain/use_case/auth_use_case.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewModel(this._authUseCase)
    : super(LoadingForgetPasswordState());
  var email = TextEditingController();
  final GlobalKey<FormState> formForgetKey = GlobalKey<FormState>();

  void doIntent(ForgetPasswordIntent forgetPasswordIntent) {
    switch (forgetPasswordIntent) {
      case ContinueClickedIntent():
        if (formForgetKey.currentState!.validate()) {
          _fetchPassword(email.text);
        }
    }
  }

  final AuthUseCase _authUseCase;

  void _fetchPassword(String email) async {
    emit(LoadingForgetPasswordState());
    var result = await _authUseCase.callForgetPassword(email);
    switch (result) {
      case Success():
        var data = result.data;
        log(data!.message.toString());
        if (data.message == "success") {
          log(data.toString());
          SharedPreferenceServices.saveData(AppConstants.email, email);
          emit(SuccessForgetPasswordState(data));
        } else {
          emit(ErrorForgetPasswordState(data.message));
        }
      case Error():
        // emit(ErrorForgetPasswordState(result.exception!.errorMessage))
        emit(ErrorForgetPasswordState(result.exception!));
    }
  }
}

sealed class ForgetPasswordIntent {}

class ContinueClickedIntent extends ForgetPasswordIntent {}
