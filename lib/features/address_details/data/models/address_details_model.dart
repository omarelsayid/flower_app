// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flower_app/features/address_details/domain/entities/address_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'address_details_model.g.dart';

@JsonSerializable()
class AddressDetailsModel {
  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;
  const AddressDetailsModel({this.formattedAddress});
  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsModelFromJson(json['results'][0]);

  AddressDetailsEntity toEntity() {
    final parts = formattedAddress?.split(',').map((e) => e.trim()).toList();

    final address = parts!.isNotEmpty ? parts[0] : '';
    final area = parts.length > 2 ? parts[2] : '';
    String city = parts.length > 3 ? parts[3] : '';

    //! Remove postal code numbers from the city
    city = city.replaceAll(RegExp(r'\d+'), '').trim();

    return AddressDetailsEntity(address: address, area: area, city: city);
  }
}
