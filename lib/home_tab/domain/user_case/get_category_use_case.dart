

import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
import '../entity/category_entity.dart';
import '../repo/category_repo.dart';

@injectable
class GetCategoriesUseCase {
  final CategoryRepo repository;

  GetCategoriesUseCase(this.repository);

  Future<Result<List<CategoryEntity>>> execute() async {
    return await repository.getCategories();
  }
}