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
    final bool phoneValid = RegExp(r"^01[0125][0-9]{8}$").hasMatch(this);
    return phoneValid;
  }
}
