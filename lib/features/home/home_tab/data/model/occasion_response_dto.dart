import 'package:json_annotation/json_annotation.dart';

part 'occasion_response_dto.g.dart';

@JsonSerializable()
class OccasionResponseDTO {
  final String message;
  final Metadata metadata;
  final List<Occasion> occasions;
  final String? error;

  OccasionResponseDTO({
    required this.message,
    required this.metadata,
    required this.occasions,
    this.error,
  });

  factory OccasionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$OccasionResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OccasionResponseDTOToJson(this);
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
class Occasion {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productsCount;

  Occasion({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.productsCount,
  });

  factory Occasion.fromJson(Map<String, dynamic> json) =>
      _$OccasionFromJson(json);
  Map<String, dynamic> toJson() => _$OccasionToJson(this);
}
