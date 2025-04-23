import 'package:json_annotation/json_annotation.dart';

part 'create_cart_reponse.g.dart';

@JsonSerializable()
class CreateCartResponse {
  final String message;

  CreateCartResponse({required this.message});

  factory CreateCartResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCartResponseToJson(this);
}
