import 'package:flutter/material.dart';

extension StringExtensions on String {
  bool get isValidEmail {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
    return emailValid;
  }

  bool get isValidPassword {
    final bool passwordValid = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
    ).hasMatch(this);
    return passwordValid;
  }

  bool get isValidPhone {
    final bool phoneValid = RegExp(r'^\+(\d{1,4})\d{7,10}$').hasMatch(this);
    return phoneValid;
  }
}

extension LocaleExtensions on BuildContext {
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}
