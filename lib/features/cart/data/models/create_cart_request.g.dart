// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCartRequest _$CreateCartRequestFromJson(Map<String, dynamic> json) =>
    CreateCartRequest(
      product: json['product'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCartRequestToJson(CreateCartRequest instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
