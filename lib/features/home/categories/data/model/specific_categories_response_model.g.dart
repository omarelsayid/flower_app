// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificCategoriesResponseModel _$SpecificCategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecificCategoriesResponseModel(
  message: json['message'] as String?,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SpecificCategoriesResponseModelToJson(
  SpecificCategoriesResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'products': instance.products,
};

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      discount: json['discount'] as num?,
      occasion: json['occasion'] as String?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      quantity: json['quantity'] as num?,
      rateAvg: json['rateAvg'] as num?,
      rateCount: json['rateCount'] as num?,
      slug: json['slug'] as String?,
      sold: json['sold'] as num?,
      v: json['v'] as num?,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      '_id': instance.id,
    };
