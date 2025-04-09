// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseDTO _$ProductsResponseDTOFromJson(Map<String, dynamic> json) =>
    ProductsResponseDTO(
      message: json['message'] as String?,
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductsDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      metadata:
          json['metadata'] == null
              ? null
              : MetadataDTO.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsResponseDTOToJson(
  ProductsResponseDTO instance,
) => <String, dynamic>{
  'message': instance.message,
  'products': instance.products,
  'metadata': instance.metadata,
};

ProductsDTO _$ProductsDTOFromJson(Map<String, dynamic> json) => ProductsDTO(
  id: json['id'] as String?,
  category: json['category'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  discount: json['discount'] as num?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  imgCover: json['imgCover'] as String?,
  occasion: json['occasion'] as String?,
  price: json['price'] as num?,
  priceAfterDiscount: json['priceAfterDiscount'] as num?,
  quantity: json['quantity'] as num?,
  sold: json['sold'] as num?,
  title: json['title'] as String?,
  rateAvg: json['rateAvg'] as num?,
  rateCount: json['rateCount'] as num?,
  v: json['v'] as num?,
);

Map<String, dynamic> _$ProductsDTOToJson(ProductsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
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
    };

MetadataDTO _$MetadataDTOFromJson(Map<String, dynamic> json) => MetadataDTO(
  currentPage: json['currentPage'] as num?,
  totalPages: json['totalPages'] as num?,
  limit: json['limit'] as num?,
  totalItems: json['totalItems'] as num?,
);

Map<String, dynamic> _$MetadataDTOToJson(MetadataDTO instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
    };
