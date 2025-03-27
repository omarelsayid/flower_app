// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BestSellerProductsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerProductsModel _$BestSellerProductsModelFromJson(
  Map<String, dynamic> json,
) => BestSellerProductsModel(
  message: json['message'] as String?,
  bestSeller:
      (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BestSellerProductsModelToJson(
  BestSellerProductsModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'bestSeller': instance.bestSeller,
};
