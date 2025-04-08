import 'dart:developer';
import 'dart:ui';
import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/core/api/api_execute.dart';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/specific_category_response_entity.dart';
import '../../domain/repository/categories_repository.dart';
import '../../presentation/manager/categories_view_model.dart';
import '../data_source/categories_remote_data_source.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);

  @override
  Future<Result<CategoriesResponseEntity>> getAllCategories() {
    return _categoriesRemoteDataSource.getAllCategories();
  }

  @override
  Future<Result<SpecificCategoriesResponseEntity>> getSpecificCategory(
    String categoryId,
  ) {
    return _categoriesRemoteDataSource.getSpecificCategory(categoryId);
  }

  @override
  Future<List<ProductsEntity>> search(String query) async {
    List<ProductsEntity> products = getIt.get<CategoriesViewModel>().products;
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // Simulate network delay
    return products
        .where(
          (product) =>
              product.title!.toUpperCase().contains(query.toUpperCase()),
        )
        .toList();

  }
}
