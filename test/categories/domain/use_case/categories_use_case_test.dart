import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/categories/domain/repository/categories_repository.dart';
import 'package:flower_app/categories/domain/use_case/categories_use_case.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_use_case_test.mocks.dart';

@GenerateMocks([CategoriesRepository])
void main() {
  group('CategoriesUseCase Test', () {
    late CategoriesRepository repo;
    late CategoriesUseCase useCase;
    setUp(() {
      repo = MockCategoriesRepository();
      useCase = CategoriesUseCase(repo);
    });
    test(
      "When call execute from Categories use case it should"
          " call getAllCategories from repository",
      () async{
        // arrange
        var result=Success(CategoriesResponseEntity(
        ));
        provideDummy<Result<CategoriesResponseEntity>>(result);
        when(repo.getAllCategories()).thenAnswer((_) async => result);
        // act
        var actual =await useCase.execute();
        // assert
        verify(repo.getAllCategories()).called(1);
        expect(actual, equals(result));

      },
    );
  });
}
