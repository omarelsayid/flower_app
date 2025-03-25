import 'package:flower_app/auth/domain/entity/sign_up_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDTO extends SignUpResponseEntity {
  @override
  @JsonKey(fromJson: UserDTO.fromJson, toJson: _userToJson)
  final UserDTO? user;

  SignUpResponseDTO({
    String? message,
    String? token,
    this.user,
  }) : super(message: message, token: token, user: user);

  factory SignUpResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDTOToJson(this);

  static Map<String, dynamic>? _userToJson(UserDTO? user) => user?.toJson();
}

@JsonSerializable()
class UserDTO extends User {
  UserDTO({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.photo,
    super.addresses,
    super.gender,
    super.role,
    super.wishlist,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
