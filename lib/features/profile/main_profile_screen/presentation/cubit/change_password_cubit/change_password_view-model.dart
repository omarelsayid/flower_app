import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/change_password_use_case.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/change_password_cubit/change_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/result.dart';
import '../../../data/model/change_password_request_model.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  ChangePasswordViewModel(this._changePasswordUseCase)
    : super(ChangePasswordLoadingState());
  final ChangePasswordUseCase _changePasswordUseCase;
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void doIntent(ChangePasswordIntent intent) {
    switch (intent) {
      case ClickedChangePasswordIntent():
        _changePassword();
        break;
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password ';
    }
    if (value != newPasswordController.text) {
      return 'Password do not match ';
    }
    return null;
  }

  Future<void> _changePassword() async {
    emit(ChangePasswordLoadingState());
    var result = await _changePasswordUseCase.execute(
      ChangePasswordRequestModel(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          emit(ChangePasswordSuccessState());
        } else {
          emit(ChangePasswordErrorState(data.error.toString()));
        }
        break;
      case Error():
        emit(ChangePasswordErrorState(result.exception.toString()));
        break;
    }
  }
}

sealed class ChangePasswordIntent {}

class ClickedChangePasswordIntent extends ChangePasswordIntent {}
