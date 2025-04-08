import 'package:json_annotation/json_annotation.dart';

part 'reset_password_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDTO {
  final String? message;
  final String? token;
  final String? error;

  ResetPasswordResponseDTO({this.message, this.token, this.error});

  factory ResetPasswordResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDTOToJson(this);
}
