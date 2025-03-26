import 'dart:developer';
import 'package:flower_app/auth/domain/use_case/auth_use_case.dart';
import 'package:flower_app/auth/presentation/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
import '../../domain/entity/sign_up_request.dart';

enum Gender { male, female, }

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  SignUpViewModel(this._authUseCase) : super(SignUpLoadingState());

  final AuthUseCase _authUseCase;

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  final GlobalKey<FormState> formSignUpKey = GlobalKey<FormState>();

  Gender? selectedGender;
  bool isGenderSelected = true;

  void updateGender(Gender gender) {
    selectedGender = gender;
    isGenderSelected = true;
    emit(SignUpGenderChangedState(selectedGender.toString()));
  }

  void doIntent(AuthIntent intent) {
    switch (intent) {
      case SignUpClickedIntent():
        _handleSignUp();
    }
  }

  Future<void> _handleSignUp() async {
    if (!formSignUpKey.currentState!.validate()) return;
    if (passwordController.text != rePasswordController.text) {
      EasyLoading.showError("Passwords do not match");
      return;
    }
    if (selectedGender == null) {
      isGenderSelected = false;
      emit(SignUpGenderChangedState("No gender selected"));
      return;
    }

    EasyLoading.show();
    emit(SignUpLoadingState());

    final genderStr = selectedGender?.name ?? '';

    var data = SignUpRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
      gender: genderStr,
    );

    var result = await _authUseCase.execute(data);
    EasyLoading.dismiss();

    switch (result) {
      case Success():
        if (result.data != null) {
          final signUpResponse = result.data!;
          final user = signUpResponse.user;
          final token = signUpResponse.token ?? "";

          if (user != null && token.isNotEmpty) {
            emit(SuccessSignUpState(user, token));
            log("Sign-up success: ${user.firstName}, Token: $token");
          } else {
            emit(SignUpErrorState("Sign-up failed: Missing user or token"));
          }
        } else {
          emit(SignUpErrorState("Sign-up failed"));
        }
        break;

      case Error():
        emit(SignUpErrorState(result.exception.toString()));
        log("Sign-up API Error: ${result.exception}");
        break;
    }
  }
}

class SuccessSignUPState {}

sealed class AuthIntent {}

class SignUpClickedIntent extends AuthIntent {}
