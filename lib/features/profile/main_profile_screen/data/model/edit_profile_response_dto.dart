import 'package:flower_app/features/profile/main_profile_screen/domain/entity/edit_profile_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDTO {
  final String? message;
  final User? user;

  EditProfileResponseDTO({this.message, this.user});

  factory EditProfileResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDTOToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final String? createdAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  EditProfileResponseEntity toEntity() {
    return EditProfileResponseEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      wishlist: wishlist,
      addresses: addresses,
    );
  }
}
