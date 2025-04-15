import 'package:json_annotation/json_annotation.dart';

part 'create_cart_request.g.dart';

@JsonSerializable()
class CreateCartRequest {
  final String product;
  final int quantity;

  CreateCartRequest({
    required this.product,
    required this.quantity,
  });

  factory CreateCartRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCartRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCartRequestToJson(this);
}
