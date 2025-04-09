import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/specific_category_response_entity.dart';

part 'specific_categories_response_model.g.dart';

@JsonSerializable()
class SpecificCategoriesResponseModel extends SpecificCategoriesResponseEntity {
  SpecificCategoriesResponseModel({super.message, this.products});

  @JsonKey(name: "products")
  final List<ProductsModel>? products;

  factory SpecificCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificCategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class ProductsModel extends ProductsEntity {
  ProductsModel({
    this.id,
    super.title,
    super.price,
    super.category,
    super.description,
    super.imgCover,
    super.images,
    super.discount,
    super.occasion,
    super.priceAfterDiscount,
    super.quantity,
    super.rateAvg,
    super.rateCount,
    super.slug,
    super.sold,
    super.v,
  });

  @JsonKey(name: "_id")
  final String? id;

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}
