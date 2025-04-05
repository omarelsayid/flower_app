

import '../../../core/common/result.dart';
import '../entity/category_entity.dart';

abstract class CategoryRepo{

  Future<Result<List<CategoryEntity>>> getCategories();
}