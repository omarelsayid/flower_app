import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_app/features/addresses/presentation/cubit/address_details_cubit.dart';
import 'package:flower_app/features/address_details/presentation/cubit/address_details_states.dart';
import 'package:flower_app/features/addresses/domain/repository/address_details_repo.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/core/common/result.dart';

// 👇 This tells Mockito to generate mocks for the repository
@GenerateMocks([AddressDetailsRepo])
import 'address_details_cubit_test.mocks.dart';

void main() {
  // 👇 Fix for MissingDummyValueError
  provideDummy<Result<dynamic>>(Success(null));

  late MockAddressDetailsRepo mockRepo;
  late AddressDetailsCubit cubit;

  setUp(() {
    mockRepo = MockAddressDetailsRepo();
    cubit = AddressDetailsCubit(mockRepo);
  });

  tearDown(() {
    cubit.close();
  });

  final testAddress = AddressDetailsModel(
    city: 'Alex',
    lat: '30.0',
    long: '30.0',
    phone: '123456789',
    street: 'street',
  );

  group('AddressDetailsCubit', () {
    blocTest<AddressDetailsCubit, AddressDetailsStates>(
      'emits [Loading, Success] when saveAddressDetails returns Success',
      build: () {
        when(
          mockRepo.saveAddressDetails(any),
        ).thenAnswer((_) async => Success(null));
        return cubit;
      },
      act: (cubit) => cubit.saveUserAddress(testAddress),
      expect:
          () => [isA<AddressDetailsLoading>(), isA<AddressDetailsSuccess>()],
      verify: (_) {
        verify(mockRepo.saveAddressDetails(testAddress)).called(1);
      },
    );

    blocTest<AddressDetailsCubit, AddressDetailsStates>(
      'emits [Loading, Error] when saveAddressDetails returns Error',
      build: () {
        when(
          mockRepo.saveAddressDetails(any),
        ).thenAnswer((_) async => Error(Exception('Failed').toString()));
        return cubit;
      },
      act: (cubit) => cubit.saveUserAddress(testAddress),
      expect:
          () => [
            isA<AddressDetailsLoading>(),
            isA<AddressDetailsError>().having(
              (e) => e.error,
              'error',
              contains('Failed'),
            ),
          ],
    );
  });
}
