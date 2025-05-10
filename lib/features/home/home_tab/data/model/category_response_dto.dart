import 'package:json_annotation/json_annotation.dart';

part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDTO {
  final String message;
  final Metadata metadata;
  final List<Category> categories;
  final String? error;

  CategoryResponseDTO({
    required this.message,
    required this.metadata,
    required this.categories,
    this.error,
  });

  factory CategoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseDTOToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int limit;
  final int totalPages;
  final int totalItems;

  Metadata({
    required this.currentPage,
    required this.limit,
    required this.totalPages,
    required this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productsCount;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.productsCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
