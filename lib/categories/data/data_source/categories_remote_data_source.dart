import 'dart:developer';

import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_execute.dart';
import '../../domain/entity/specific_category_response_entity.dart';

abstract class CategoriesRemoteDataSource {
  Future<Result<CategoriesResponseEntity>> getAllCategories();
  Future<Result<SpecificCategoriesResponseEntity>>getSpecificCategory(String categoryId);
}
@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiClient _apiClient;
  CategoriesRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<CategoriesResponseEntity>> getAllCategories()async {
    return executeApi(() async {
      var response = await _apiClient.getAllCategories();
      log("response ${response.categories!.length}");
      return response;
    });
  }

  @override
  Future<Result<SpecificCategoriesResponseEntity>> getSpecificCategory(String categoryId) async{
    return executeApi(
          () async {
        var response= await _apiClient.getSpecificCategory(categoryId);

        log("response ${response.message}");
        return response;
      },
    );
  }
}