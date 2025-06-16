import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: 'product')
  final ProductModel? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  CartItemModel({this.product, this.price, this.quantity, this.id});

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
