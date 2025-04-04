import 'package:flower_app/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
import '../entity/categories_response_entity.dart';
import '../entity/specific_category_response_entity.dart';

@injectable
class CategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  CategoriesUseCase(this._categoriesRepository);

  Future<Result<CategoriesResponseEntity>> execute() {
    return _categoriesRepository.getAllCategories();
  }

  Future<Result<SpecificCategoriesResponseEntity>> call(
    String categoryId,
  ) {
    return _categoriesRepository.getSpecificCategory(categoryId);
  }
}
