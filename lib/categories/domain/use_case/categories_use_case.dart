import 'package:flower_app/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
import '../entity/categories_response_entity.dart';
@injectable
class CategoriesUseCase {
 final CategoriesRepository _categoriesRepository;
  CategoriesUseCase(this._categoriesRepository);

  Future<Result<CategoriesResponseEntity>> execute() {
    return _categoriesRepository.getAllCategories();
  }
}