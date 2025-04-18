import 'package:flower_app/features/home/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/categories_response_entity.dart';
import '../entity/specific_category_response_entity.dart';
import '../../../categories//domain/entity/products_response_entity.dart';


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
  Future<List<ProductsEntity>> invoke(String search) {
    return _categoriesRepository.search(search);
  }
  Future<Result<ProductsResponseEntity>> executeFilter(String sort) async{
    return await _categoriesRepository.getFilterDetails(sort);

  }

}
