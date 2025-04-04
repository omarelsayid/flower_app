import 'dart:developer';
import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/core/api/api_execute.dart';

import 'package:flower_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/specific_category_response_entity.dart';
import '../../domain/repository/categories_repository.dart';
import '../data_source/categories_remote_data_source.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);

  @override
  Future<Result<CategoriesResponseEntity>> getAllCategories() {
    return executeApi(() async {
      var response = await _categoriesRemoteDataSource.getAllCategories();
      log("response ${response.categories!.length}");
      return response;
    });
  }

  @override
  Future<Result<SpecificCategoriesResponseEntity>> getSpecificCategory(
      String categoryId,) {
    return executeApi(
          () async {
        var response= await _categoriesRemoteDataSource.getSpecificCategory(categoryId);

        log("response ${response.message}");
        return response;
      },
    );
  }
}
