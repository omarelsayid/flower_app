import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/core/common/result.dart';

import '../entity/specific_category_response_entity.dart';

abstract class CategoriesRepository {
  Future<Result<CategoriesResponseEntity>> getAllCategories();
  Future<Result<SpecificCategoriesResponseEntity>> getSpecificCategory(String categoryId);
  Future<List<ProductsEntity>> search(String query);
}

