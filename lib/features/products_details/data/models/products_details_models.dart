import 'package:flower_app/features/products_details/domain/entities/products_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products_details_models.g.dart';

@JsonSerializable()
class ProductsDetailsModels extends ProductDetailsEntity {
  @JsonKey(name: '_id')
  final String id;
const  ProductsDetailsModels({
    required this.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.imgCover,
    required super.images,
    required super.price,
    required super.priceAfterDiscount,
    required super.quantity,
    required super.category,
    required super.occasion,
    required super.createdAt,
    required super.updatedAt,
    required super.discount,
    required super.sold,
    required super.rateAvg,
    required super.rateCount,
  });

  factory ProductsDetailsModels.fromJson(Map<String, dynamic> json) =>
      _$ProductsDetailsModelsFromJson(json['product']);

  /// Method for serialization
  Map<String, dynamic> toJson() => _$ProductsDetailsModelsToJson(this);

ProductDetailsEntity toEntity() => ProductDetailsEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      discount: discount,
      sold: sold,
      rateAvg: rateAvg,
      rateCount: rateCount,
    );

}
