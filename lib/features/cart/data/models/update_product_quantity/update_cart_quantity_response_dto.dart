import 'package:json_annotation/json_annotation.dart';

part 'update_cart_quantity_response_dto.g.dart';

@JsonSerializable()
class UpdateCartQuantityResponseDTO {
  final String message;

  UpdateCartQuantityResponseDTO({required this.message});

  factory UpdateCartQuantityResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartQuantityResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCartQuantityResponseDTOToJson(this);
}
