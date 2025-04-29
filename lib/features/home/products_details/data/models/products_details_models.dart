import 'package:flower_app/features/home/products_details/domain/entities/products_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products_details_models.g.dart';

@JsonSerializable()
class ProductsDetailsModels extends ProductDetailsEntity {
  @JsonKey(name: '_id')
  final String? id;
  const ProductsDetailsModels({
    this.id,
    super.title,
    super.slug,
    super.description,
    super.imgCover,
    super.images,
    super.price,
    super.priceAfterDiscount,
    super.quantity,
    super.category,
    super.occasion,
    super.createdAt,
    super.updatedAt,
    super.discount,
    super.sold,
    super.rateAvg,
    super.rateCount,
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
