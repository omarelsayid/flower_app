import 'package:json_annotation/json_annotation.dart';
import 'cart_model.dart';

part 'user_cart_response_model.g.dart';

@JsonSerializable()
class UserCartResponseModel {
  final String message;
  final int numOfCartItems;
  final CartModel cart;

  UserCartResponseModel({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });

  factory UserCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserCartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserCartResponseModelToJson(this);
}
