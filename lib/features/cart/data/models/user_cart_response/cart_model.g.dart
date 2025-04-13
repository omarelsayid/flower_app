// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  id: json['_id'] as String,
  user: json['user'] as String,
  cartItems:
      (json['cartItems'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  discount: (json['discount'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toInt(),
  totalPriceAfterDiscount: (json['totalPriceAfterDiscount'] as num).toInt(),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'cartItems': instance.cartItems,
  'discount': instance.discount,
  'totalPrice': instance.totalPrice,
  'totalPriceAfterDiscount': instance.totalPriceAfterDiscount,
};
