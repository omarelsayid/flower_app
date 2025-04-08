import 'package:equatable/equatable.dart';

class SignUpRequest extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String gender;

 const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.gender,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return SignUpRequest(
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      rePassword: json["rePassword"] ?? "",
      phone: json["phone"] ?? "",
      gender: json["gender"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone,
      "gender": gender
    };
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    rePassword,
    phone,
    gender
  ];

}
