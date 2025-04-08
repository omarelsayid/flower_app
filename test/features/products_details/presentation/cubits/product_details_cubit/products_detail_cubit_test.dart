import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/products_details/domain/entities/products_details_entity.dart';
import 'package:flower_app/features/products_details/domain/repositories/get_product_details_repo.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([GetProductDetailsRepo])
import 'products_detail_cubit_test.mocks.dart';

void main() {
  // Dummy Data (included in the same file)
  const String productId = '123';

  // simulation for the data that come for the API
  final ProductDetailsEntity dummyProduct = ProductDetailsEntity(
    id: productId,
    slug: 'Rose',
    price: 10.0,
    quantity: 5,
    description: 'Beautiful rose',
  );

  setUpAll(() {
    // Provide a dummy value for Result<ProductDetailsEntity> to prevent MissingDummyValueError
    provideDummy<Result<ProductDetailsEntity>>(
      Success<ProductDetailsEntity>(dummyProduct),
    );
  });

  late ProductsDetailCubit cubit;
  late MockGetProductDetailsRepo mockRepo;

  setUp(() {
    mockRepo = MockGetProductDetailsRepo();
    cubit = ProductsDetailCubit(mockRepo);
  });

  tearDown(() {
    cubit.close();
  });

  group('getProductDetails', () {
    blocTest<ProductsDetailCubit, ProductsDetailStates>(
      'emits [ProductsDetailLoading, ProductsDetailSuccess] when fetching product details succeeds',
      build: () {
        when(
          mockRepo.getProductDetails(productId),
        ).thenAnswer((_) async => Success(dummyProduct));
        return cubit;
      },
      act: (cubit) => cubit.getProductDetails(productId),
      expect:
          () => [isA<ProductsDetailLoading>(), isA<ProductsDetailSuccess>()],
      verify: (_) {
        verify(mockRepo.getProductDetails(productId)).called(1);
      },
    );

    blocTest<ProductsDetailCubit, ProductsDetailStates>(
      'emits [ProductsDetailLoading, ProductsDetailError] when fetching product details fails',
      build: () {
        when(
          mockRepo.getProductDetails(productId),
        ).thenAnswer((_) async => Error('Failed to fetch'));
        return cubit;
      },
      act: (cubit) => cubit.getProductDetails(productId),
      expect: () => [isA<ProductsDetailLoading>(), isA<ProductsDetailError>()],
      verify: (_) {
        verify(mockRepo.getProductDetails(productId)).called(1);
      },
    );
  });
}
