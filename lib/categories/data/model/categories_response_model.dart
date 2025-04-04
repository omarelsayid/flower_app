import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';
@JsonSerializable()
class CategoriesResponseModel extends CategoriesResponseEntity{
  CategoriesResponseModel({
    this.categories,
    super.message,
  });

  @JsonKey(name: 'categories')
 final List<CategoriesModel>? categories;
  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class CategoriesModel extends CategoriesEntity{
  CategoriesModel({
    this.id,
    super.name,
    super.image,
    super.slug,
    super.createdAt,
    super.updatedAt,
    super.productsCount,
});

  @JsonKey(name: '_id')
  final String? id;
  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);
}
