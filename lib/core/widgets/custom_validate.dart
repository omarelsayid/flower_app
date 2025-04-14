import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/change_password_cubit/change_password_view-model.dart';

import '../../di/injectable_initializer.dart';

class AppValidate {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email ';
    }
    final regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email ';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name ';
    }
    final regex = RegExp(r'^[A-Za-z\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid full name ';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password ';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters long ';
    }
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (!regex.hasMatch(value)) {
      return 'Password should contain at least one uppercase letter, one lowercase letter, one number, and one special character ';
    }
    return null;
  }

  // static String? validateConfirmPassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please confirm your password ';
  //   }
  //   if (value != getIt<ChangePasswordViewModel>().newPasswordController.text) {
  //     return 'Password do not match ';
  //   }
  //   return null;
  // }

  static String? validateUserName(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!userNameRegex.hasMatch(value)) {
      return 'Please enter a valid username';
    } else {
      return null;
    }
  }

  // static String? validateMobile(String? value) {
  //   RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter mobile number';
  //   } else if (!regExp.hasMatch(value)) {
  //     return 'Please enter valid mobile number';
  //   }
  //   return null;
  // }
  static String? validateMobile(String? value) {
    RegExp regExp = RegExp(r'^\+(\d{1,4})\d{7,10}$');

    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number (e.g., +201010700999)';
    }
    return null;
  }
}
