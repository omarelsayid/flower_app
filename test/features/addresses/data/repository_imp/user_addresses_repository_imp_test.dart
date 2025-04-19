import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/data_source/user_addresses_remote_data_source.dart';
import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:flower_app/features/addresses/data/repository_imp/user_addresses_repository_imp.dart';
import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_addresses_repository_imp_test.mocks.dart';

@GenerateMocks([UserAddressesRemoteDataSource])
void main() {
  late UserAddressesRemoteDataSource dataSource;
  late UserAddressesRepositoryImpl repo;
  setUp(() {
    dataSource = MockUserAddressesRemoteDataSource();
    repo = UserAddressesRepositoryImpl(dataSource,);
  });

  group('UserAddressesRepositoryImpl tests', () {

    test("Should return getUserAddresses", () async {

      var response = UserAddressesDTO();

      when(dataSource.getUserAddresses())
          .thenAnswer((_) async => response);

      var actual = await repo.getUserAddresses();

      verify(dataSource.getUserAddresses()).called(1);

      expect(actual, isA<Success<UserAddressesEntity>>());

    });

    test("Should delete user address", () async {
      const testId = "123";
      final response = UserAddressesDTO();

      when(dataSource.deleteUserAddress(testId))
          .thenAnswer((_) async => response);

      final actual = await repo.deleteUserAddress(testId);

      verify(dataSource.deleteUserAddress(testId)).called(1);
      expect(actual, isA<Success<UserAddressesEntity>>());
    });
  });
}



