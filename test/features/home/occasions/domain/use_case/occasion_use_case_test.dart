import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import 'package:flower_app/features/home/occasions/domain/repository/occasion_repository.dart';
import 'package:flower_app/features/home/occasions/domain/use_case/occasion_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_use_case_test.mocks.dart';

@GenerateMocks([OccasionRepository])
void main() {
  late OccasionUseCase useCase;
  late OccasionRepository repo;

  setUp(() {
    repo = MockOccasionRepository();
    useCase = OccasionUseCase(repo);
  });

  group('Occasion use case test', () {
    test(
      "when call execute from use case it should call occasion from repo", () async {
      var result = Success<OccasionsResponseEntity>(OccasionsResponseEntity());
      provideDummy<Result<OccasionsResponseEntity>>(result);

      when(repo.getOccasion()).thenAnswer((_) async=> result);


      var actual = await useCase.execute();

      verify(repo.getOccasion()).called(1);

      expect(actual, equals(result));
    },
    );

    test(
      "when call executeSpecific from use case it should call specific occasion from repo",
          () async {
        var occasionId = "1";

        var result = Success<ProductsResponseEntity>(ProductsResponseEntity());
        provideDummy<Result<ProductsResponseEntity>>(result);

        when(repo.getSpecificOccasion(occasionId)).thenAnswer((_) async => result);

        var actual = await useCase.executeSpecific(occasionId);

        verify(repo.getSpecificOccasion(occasionId)).called(1);

        expect(actual, equals(result));
      },
    );

  });
}




