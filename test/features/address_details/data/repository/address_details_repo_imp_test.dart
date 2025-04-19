// test/address_details_repo_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_source.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/data/repository/address_details_repo_imp.dart';
import 'address_details_repo_imp_test.mocks.dart';

// -----------------------
// Mockito Approach
// -----------------------
@GenerateMocks([AddressDetailsDataSource])
void main() {
  late MockAddressDetailsDataSource mockDataSource;
  late AddressDetailsRepoImp repo;

  setUp(() {
    mockDataSource = MockAddressDetailsDataSource();
    repo = AddressDetailsRepoImp(mockDataSource);
  });

  group('AddressDetailsRepoImp - Mockito', () {
    final testModel = AddressDetailsModel(
      street: 'Elm Street',
      city: 'Gotham',
      lat: '37.7749',
      long: '-122.4194',
      phone: '1234567890',
      userName: 'John Doe',
    );

    test('should return Success when saveAddressDetails completes', () async {
      // Arrange
      when(mockDataSource.saveAddressDetails(testModel))
          .thenAnswer((_) async {});

      // Act
      final result = await repo.saveAddressDetails(testModel);

      // Assert
      expect(result, isA<Success>());
      verify(mockDataSource.saveAddressDetails(testModel)).called(1);
    });

    test('should return Failure when saveAddressDetails throws', () async {
      // Arrange
      when(mockDataSource.saveAddressDetails(testModel))
          .thenThrow(Exception('Data source error'));

      // Act
      final result = await repo.saveAddressDetails(testModel);

      // Assert
      expect(result, isA<Error>());
      verify(mockDataSource.saveAddressDetails(testModel)).called(1);
    });
  });
}
