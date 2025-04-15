// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_quantity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartQuantityRequest _$UpdateCartQuantityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCartQuantityRequest(
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateCartQuantityRequestToJson(
        UpdateCartQuantityRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
    };
