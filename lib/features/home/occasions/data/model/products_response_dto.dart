import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/products_response_entity.dart';
part 'products_response_dto.g.dart';

@JsonSerializable()
class ProductsResponseDTO extends ProductsResponseEntity {
  @override
  final List<ProductsDTO>? products;
  @override
  final MetadataDTO? metadata;

  ProductsResponseDTO({
    super.message,
    this.products,
    this.metadata
  });

  factory ProductsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseDTOToJson(this);
}

@JsonSerializable()
class ProductsDTO extends Products {
   const ProductsDTO({
    super.id,
    super.category,
    super.slug,
    super.description,
     super.discount,
     super.images,
     super.imgCover,
     super.occasion,
     super.price,
     super.priceAfterDiscount,
     super.quantity,
     super.sold,
     super.title,
     super.rateAvg,
     super.rateCount,
     super.v
  });

   factory ProductsDTO.fromJson(Map<String, dynamic> json) =>
       _$ProductsDTOFromJson(json);

   Map<String, dynamic> toJson() => _$ProductsDTOToJson(this);
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

  Map<String, dynamic> toJson() => _$MetadataDTOToJson(this);
}
