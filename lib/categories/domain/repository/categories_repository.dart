import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/core/common/result.dart';

abstract class CategoriesRepository {
  Future<Result<CategoriesResponseEntity>> getAllCategories();
}