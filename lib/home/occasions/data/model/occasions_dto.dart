import 'package:flower_app/home/occasions/domain/entity/occasions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'occasions_dto.g.dart';
@JsonSerializable()
class OccasionsResponseDTO extends OccasionsResponseEntity {
  @override
  final MetadataDTO? metadata;
  @override
  final List<OccasionDTO>? occasions;

  OccasionsResponseDTO({
    super.message,
    this.metadata,
    this.occasions,
  });

  // factory OccasionsResponseDTO.fromJson(Map<String, dynamic> json) {
  //   return OccasionsResponseDTO(
  //     message: json['message'],
  //     metadata: json['metadata'] != null ? MetadataDTO.fromJson(json['metadata']) : null,
  //     occasions: (json['occasions'] as List?)?.map((e) => OccasionDTO.fromJson(e)).toList(),
  //   );
  // }

  factory OccasionsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$OccasionsResponseDTOFromJson(json);


}

@JsonSerializable()
class OccasionDTO extends Occasion {
  @JsonKey(name: '_id')
  @override
  final String? id;
  const OccasionDTO({
    this.id,
    super.name,
    super.slug,
    super.image,
    super.productsCount,
  });

   factory OccasionDTO.fromJson(Map<String, dynamic> json) =>
       _$OccasionDTOFromJson(json);
}

@JsonSerializable()
class MetadataDTO extends Metadata {
  MetadataDTO({
    super.currentPage,
    super.totalPages,
    super.limit,
    super.totalItems,
  });


  factory MetadataDTO.fromJson(Map<String, dynamic> json) =>
      _$MetadataDTOFromJson(json);

}
