import 'package:flower_app/categories/data/data_source/categories_remote_data_source.dart';
import 'package:flower_app/categories/data/repository_impl/categories_repository_impl.dart';
import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/categories/domain/entity/specific_category_response_entity.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_repository_impl_test.mocks.dart';
@GenerateMocks([CategoriesRemoteDataSource])
void main() {
  group("CategoriesRepositoryImpl Test", () {
    late CategoriesRepositoryImpl repo;
    late CategoriesRemoteDataSource dataSource;
    setUp(() {
      dataSource = MockCategoriesRemoteDataSource();
      repo = CategoriesRepositoryImpl(dataSource);
    },);
    test(
      "when call getAllCategories from CategoriesRepositoryImpl "
      "it should call getAllCategories from CategoriesRemoteDataSource",
      ()async {
        // arrange
        var result= Success(CategoriesResponseEntity(categories: []));
        provideDummy<Result<CategoriesResponseEntity>>(result);
        when(dataSource.getAllCategories()).thenAnswer((_) async =>result);
        // act
        var actual=await repo.getAllCategories();
        // assert
        verify(dataSource.getAllCategories()).called(1);
        expect(actual, equals(result));
      },
    );
  });
}
