import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;

  EditProfileRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
