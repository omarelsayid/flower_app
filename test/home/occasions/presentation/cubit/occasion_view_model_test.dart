import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import 'package:flower_app/features/home/occasions/domain/use_case/occasion_use_case.dart';
import 'package:flower_app/features/home/occasions/presentation/cubit/occasion_state.dart';
import 'package:flower_app/features/home/occasions/presentation/cubit/occasion_view_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

// import '../../../../helper/test_helper.mocks.dart';
import 'occasion_view_model_test.mocks.dart';
@GenerateMocks([OccasionUseCase])

void main() {
  late OccasionViewModel viewModel;
  late MockOccasionUseCase mockOccasionUseCase;

  setUpAll(() {
    registerFallbackValue(OccasionsResponseEntity(occasions: []));
    registerFallbackValue(ProductsResponseEntity(products: []));
  });

  setUp(() {
    mockOccasionUseCase = MockOccasionUseCase();
    viewModel = OccasionViewModel(mockOccasionUseCase);
  });

  group('OccasionViewModel Test', () {
    blocTest<OccasionViewModel, OccasionState>(
      'should emit [LoadingState, SuccessState] when getOccasions success',
      build: () {
        when(() => mockOccasionUseCase.execute())
            .thenAnswer((_) async => Success(OccasionsResponseEntity(occasions: [
          Occasion(id: '1', name: 'Wedding'),
          Occasion(id: '2', name: 'Birthday'),
        ])));
        return viewModel;
      },
      act: (cubit) => cubit.doIntent(OccasionClickedIntent()),
      expect: () => [
        LoadingOccasionState(),
        SuccessOccasionState(
          [
            Occasion(id: '1', name: 'Wedding'),
            Occasion(id: '2', name: 'Birthday')
          ],
        ),
      ],
    );

    blocTest<OccasionViewModel, OccasionState>(
      'should emit [LoadingState, ErrorState] when getOccasions fails',
      build: () {
        when(() => mockOccasionUseCase.execute())
            .thenAnswer((_) async => Error('Error Message'));
        return viewModel;
      },
      act: (cubit) => cubit.doIntent(OccasionClickedIntent()),
      expect: () => [
        LoadingOccasionState(),
        ErrorOccasionState('Error Message'),
      ],
    );

    blocTest<OccasionViewModel, OccasionState>(
      'should emit [LoadingState, SuccessState] when getOccasionsSpecific success',
      build: () {
        when(() => mockOccasionUseCase.executeSpecific(any()))
            .thenAnswer((_) async => Success(ProductsResponseEntity(products: [
          Products(id: '1', title: 'Rose', price: 20),
          Products(id: '2', title: 'Tulip', price: 15),
        ])));
        return viewModel;
      },
      act: (cubit) => cubit.doIntent(SpecificOccasionClickedIntent("1")),
      expect: () => [
        LoadingOccasionState(),
        SuccessSpecificOccasionState(
           [
            Products(id: '1', title: 'Rose', price: 20),
            Products(id: '2', title: 'Tulip', price: 15)
          ],
        ),
      ],
    );

    blocTest<OccasionViewModel, OccasionState>(
      'should emit [LoadingState, ErrorState] when getOccasionsSpecific fails',
      build: () {
        when(() => mockOccasionUseCase.executeSpecific(any()))
            .thenAnswer((_) async => Error('Error Specific'));
        return viewModel;
      },
      act: (cubit) => cubit.doIntent(SpecificOccasionClickedIntent("1")),
      expect: () => [
        LoadingOccasionState(),
        ErrorOccasionState('Error Specific'),
      ],
    );
  });
}
