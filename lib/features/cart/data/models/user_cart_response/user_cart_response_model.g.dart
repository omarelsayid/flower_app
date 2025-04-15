// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartResponseModel _$UserCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserCartResponseModel(
      message: json['message'] as String,
      numOfCartItems: (json['numOfCartItems'] as num).toInt(),
      cart: CartModel.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCartResponseModelToJson(
        UserCartResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };
