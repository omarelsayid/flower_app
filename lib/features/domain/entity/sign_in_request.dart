import 'package:equatable/equatable.dart';

class SignInRequest extends Equatable {
  final String email;
  final String password;

  const SignInRequest({required this.email, required this.password});

  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return SignInRequest(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  @override
  List<Object?> get props => [email, password];
}
