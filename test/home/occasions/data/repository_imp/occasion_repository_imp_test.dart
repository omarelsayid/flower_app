import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/home/occasions/data/data_source/occasion_remote_data_source.dart';
import 'package:flower_app/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/home/occasions/data/model/products_response_dto.dart';
import 'package:flower_app/home/occasions/data/repository_imp/occasion_repository_imp.dart';
import 'package:flower_app/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/home/occasions/domain/entity/products_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_repository_imp_test.mocks.dart';

@GenerateMocks([OccasionRemoteDataSource])
void main() {
  late OccasionRemoteDataSource dataSource;
  late OccasionRepositoryImpl repo;
  setUp(() {
    dataSource = MockOccasionRemoteDataSource();
    repo = OccasionRepositoryImpl(dataSource,);
  });

  group('OccasionRepositoryImpl tests', () {

    test("Should return getOccasion", () async {

        var response = OccasionsResponseDTO();

        when(dataSource.getOccasion())
            .thenAnswer((_) async => response);

        var actual = await repo.getOccasion();

        verify(dataSource.getOccasion()).called(1);

        expect(actual, isA<Success<OccasionsResponseEntity>>());

    });

    // test("Should return getSpecificOccasion", () async {
    //   var occasionId = "1";
    //   var result = Success<ProductsResponseEntity>(ProductsResponseEntity());
    //   provideDummy<Result<ProductsResponseEntity>>(result);
    //
    //   when(repo.getSpecificOccasion(occasionId)).thenAnswer((_) async=> result);
    //
    //   var actual = await repo.getSpecificOccasion(occasionId);
    //
    //   verify(dataSource.getOccasionDetails(occasionId)).called(1);
    //
    //   expect(actual, equals(result));
    // });
    test("Should return getSpecificOccasion", () async {
      var occasionId = "1";
      var response = ProductsResponseDTO();

      when(dataSource.getOccasionDetails(occasionId))
          .thenAnswer((_) async => response);

      var actual = await repo.getSpecificOccasion(occasionId);

      verify(dataSource.getOccasionDetails(occasionId)).called(1);

      expect(actual, isA<Success<ProductsResponseEntity>>());
    });
});
}



