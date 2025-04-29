import 'package:json_annotation/json_annotation.dart';
part 'delete_cart_response_dto.g.dart';

@JsonSerializable()
class DeleteCartResponseDTO {
  final String message;

  DeleteCartResponseDTO({required this.message});

  factory DeleteCartResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteCartResponseDTOToJson(this);
}
