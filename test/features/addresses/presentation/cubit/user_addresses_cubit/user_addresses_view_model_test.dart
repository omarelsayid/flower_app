import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_app/features/addresses/domain/use_case/user_addresses_use_case.dart';
import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_state.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_view_model.dart';
import 'package:flower_app/core/common/result.dart';

import 'user_addresses_view_model_test.mocks.dart';

@GenerateMocks([UserAddressesUseCase])
void main() {
  provideDummy<Result<UserAddressesEntity>>(Success(UserAddressesEntity(addresses: [])));

  late MockUserAddressesUseCase mockUseCase;
  late UserAddressesViewModel viewModel;

  final mockAddresses = [
    Address(id: '1', phone: '123', city: 'Sanaa', street: 'Street', username: 'Faten', lat: 'X', long: 'Y'),
    Address(id: '2', phone: '123', city: 'Sanaa', street: 'Street', username: 'Fatima', lat: 'X', long: 'Y'),
  ];

  final addressEntity = UserAddressesEntity(addresses: mockAddresses);

  setUp(() {
    mockUseCase = MockUserAddressesUseCase();
    viewModel = UserAddressesViewModel(mockUseCase);
  });

  tearDown(() => viewModel.close());

  group('UserAddressesViewModel', () {
    blocTest<UserAddressesViewModel, UserAddressesState>(
      'emits [Loading, Success] when GetUserAddressesClickedIntent returns Success',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Success(addressEntity));
        return viewModel;
      },
      act: (vm) => vm.doIntent(GetUserAddressesClickedIntent()),
      expect: () => [
        isA<LoadingUserAddressesState>(),
        isA<SuccessUserAddressesState>()
            .having((state) => state.data.length, 'data length', 2),
      ],
    );

    blocTest<UserAddressesViewModel, UserAddressesState>(
      'emits [Loading, Error] when GetUserAddressesClickedIntent returns Error',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Error<UserAddressesEntity>('delete failed')
        );
        return viewModel;
      },
      act: (vm) => vm.doIntent(GetUserAddressesClickedIntent()),
      expect: () => [
        isA<LoadingUserAddressesState>(),
        isA<ErrorUserAddressesState>()
            .having((state) => state.message.toString(), 'error', contains('delete failed')),

      ],
    );

    blocTest<UserAddressesViewModel, UserAddressesState>(
      'emits [Success with deletingId, Success with updated list] when DeleteUserAddressClickedIntent returns Success',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Success(addressEntity));
        when(mockUseCase.executeDeletion('2'))
            .thenAnswer((_) async => Success(UserAddressesEntity(
          addresses: [mockAddresses.first],
        )));
        return viewModel;
      },
      act: (vm) async {
        vm.doIntent(GetUserAddressesClickedIntent());
        await Future.delayed(Duration.zero);
        vm.doIntent(DeleteUserAddressClickedIntent('2'));
      },
      expect: () => [
        isA<LoadingUserAddressesState>(),
        isA<SuccessUserAddressesState>()
            .having((state) => state.data.length, 'data length', 2),
        isA<SuccessUserAddressesState>()
            .having((state) => state.deletingId, 'deletingId', '2'),
        isA<SuccessUserAddressesState>()
            .having((state) => state.data.length, 'data length after delete', 1),
      ],
    );

    blocTest<UserAddressesViewModel, UserAddressesState>(
      'emits [Loading, Success] when GetUserAddressesClickedIntent returns Success',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Success(addressEntity)); // <-- Ensure this
        return viewModel;
      },
      act: (vm) => vm.doIntent(GetUserAddressesClickedIntent()),
      expect: () => [
        isA<LoadingUserAddressesState>(),
        isA<SuccessUserAddressesState>().having((state) => state.data.length, 'data length', 2),
      ],
    );

    blocTest<UserAddressesViewModel, UserAddressesState>(
      'emits [Success with deletingId, Success with updated list] when DeleteUserAddressClickedIntent returns Success',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Success(addressEntity));
        when(mockUseCase.executeDeletion('2'))
            .thenAnswer((_) async => Success(UserAddressesEntity(
          addresses: [mockAddresses.first],
        )));
        return viewModel;
      },
      act: (vm) async {
        vm.doIntent(GetUserAddressesClickedIntent());
        await Future.delayed(Duration.zero); // Delay for state updates
        vm.doIntent(DeleteUserAddressClickedIntent('2'));
      },
      expect: () => [
        isA<LoadingUserAddressesState>(),
        isA<SuccessUserAddressesState>().having((state) => state.data.length, 'data length', 2),
        isA<SuccessUserAddressesState>().having((state) => state.deletingId, 'deletingId', '2'),
        isA<SuccessUserAddressesState>().having((state) => state.data.length, 'data length after delete', 1),
      ],
    );


  });
}
