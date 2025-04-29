// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsResponseDTO _$OccasionsResponseDTOFromJson(
        Map<String, dynamic> json) =>
    OccasionsResponseDTO(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDTO.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => OccasionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccasionsResponseDTOToJson(
        OccasionsResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'occasions': instance.occasions,
    };

OccasionDTO _$OccasionDTOFromJson(Map<String, dynamic> json) => OccasionDTO(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      productsCount: json['productsCount'] as num?,
    );

Map<String, dynamic> _$OccasionDTOToJson(OccasionDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'productsCount': instance.productsCount,
      '_id': instance.id,
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
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
