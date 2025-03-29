import 'package:flower_app/categories/data/model/categories_response_model.dart';
import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_client.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponseEntity> getAllCategories();
}
@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiClient _apiClient;
  CategoriesRemoteDataSourceImpl(this._apiClient);
  @override
  Future<CategoriesResponseEntity> getAllCategories()async {
    CategoriesResponseEntity response=await _apiClient.getAllCategories();
    return response;
  }
}