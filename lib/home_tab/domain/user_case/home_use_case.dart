

import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
import '../entity/category_entity.dart';
import '../repo/home_repo.dart';

@injectable
class HomeUseCase {
  final HomeRepo repository;

  HomeUseCase(this.repository);

  Future<Result<List<MasterEntity>>> executeCategory() async {
    return await repository.getCategories();
  }

  Future<Result<List<MasterEntity>>> executeOccasion() async {
    return await repository.getOccasion();
  }

}