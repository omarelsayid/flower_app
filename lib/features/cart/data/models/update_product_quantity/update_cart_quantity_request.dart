import 'package:json_annotation/json_annotation.dart';

part 'update_cart_quantity_request.g.dart';

@JsonSerializable()
class UpdateCartQuantityRequest {
  final int quantity;

  UpdateCartQuantityRequest({required this.quantity});

  factory UpdateCartQuantityRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartQuantityRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCartQuantityRequestToJson(this);
}
