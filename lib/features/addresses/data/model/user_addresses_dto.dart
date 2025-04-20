import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_addresses_dto.g.dart';

@JsonSerializable()
class UserAddressesDTO extends UserAddressesEntity {
  // @JsonKey(name: 'address'
  @JsonKey(name: 'addresses')
  final List<AddressDTO>? address;

  UserAddressesDTO({
    String? message,
    this.address,
  }) : super(
    message: message,
    addresses: address,
  );

  factory UserAddressesDTO.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressesDTOToJson(this);
}

@JsonSerializable()
class AddressDTO extends Address {
  @JsonKey(name: '_id')
  @override
  final String? id;

  AddressDTO({
    super.street,
    super.phone,
    super.city,
    super.lat,
    super.long,
    super.username,
    this.id,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
}
