

import '../../../../../core/common/result.dart';
import '../entity/category_entity.dart';

abstract class HomeRepo{

  Future<Result<List<MasterEntity>>> getCategories();
  Future<Result<List<MasterEntity>>> getOccasion();
}
