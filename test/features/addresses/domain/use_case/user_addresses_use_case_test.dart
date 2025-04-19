import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flower_app/features/addresses/domain/repository/user_addresses_repository.dart';
import 'package:flower_app/features/addresses/domain/use_case/user_addresses_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_addresses_use_case_test.mocks.dart';

@GenerateMocks([UserAddressesRepository])
void main() {
  late UserAddressesUseCase useCase;
  late UserAddressesRepository repo;

  setUp(() {
    repo = MockUserAddressesRepository();
    useCase = UserAddressesUseCase(repo);
  });

  group('UserAddresses use case test', () {
    test(
      "when call execute from use case it should call userAddresses from repo", () async {
      var result = Success<UserAddressesEntity>(UserAddressesEntity());
      provideDummy<Result<UserAddressesEntity>>(result);

      when(repo.getUserAddresses()).thenAnswer((_) async=> result);


      var actual = await useCase.execute();

      verify(repo.getUserAddresses()).called(1);

      expect(actual, equals(result));
    },
    );

    test(
      "when call executeDeletion from use case it should call deleteUserAddress from repo",
          () async {
        // arrange
        const testId = "123";
        final result = Success<UserAddressesEntity>(UserAddressesEntity());
        provideDummy<Result<UserAddressesEntity>>(result);

        when(repo.deleteUserAddress(testId)).thenAnswer((_) async => result);

        // act
        final actual = await useCase.executeDeletion(testId);

        // assert
        verify(repo.deleteUserAddress(testId)).called(1);
        expect(actual, equals(result));
      },
    );

  });
}




