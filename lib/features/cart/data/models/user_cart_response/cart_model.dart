import 'package:json_annotation/json_annotation.dart';
import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final List<CartItemModel> cartItems;
  final int discount;
  final int totalPrice;
  final int totalPriceAfterDiscount;
  // Optionally add createdAt, updatedAt, etc.

  CartModel({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.discount,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
