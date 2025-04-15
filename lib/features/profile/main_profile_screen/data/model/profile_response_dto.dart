
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response_dto.g.dart';
@JsonSerializable()
class ProfileResponseDTO extends ProfileResponseEntity {
  @override
  final UserDTO? user;

  ProfileResponseDTO({
    super.message,
    this.user,
  });


  factory ProfileResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseDTOToJson(this);



}

@JsonSerializable()
class UserDTO extends UserEntity {
  @JsonKey(name: '_id')
  @override
  final String? id;
   UserDTO({
    this.id,
    super.firstName,
    super.lastName,
    super.phone,
    super.gender,
    super.email,
    super.addresses,
    super.photo,
    super.role,
    super.wishlist,
  });

   factory UserDTO.fromJson(Map<String, dynamic> json) =>
       _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

}
