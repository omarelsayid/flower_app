import 'package:flutter_test/flutter_test.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/products_details/data/data_source/products_details_remote_data_scource.dart';
import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';
import 'package:flower_app/features/home/products_details/data/repositories/products_detail_repo_imp.dart';
import 'package:flower_app/features/home/products_details/domain/entities/products_details_entity.dart';
import 'package:flower_app/features/home/products_details/domain/repositories/get_product_details_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ProductsDetailsRemoteDataScource])
import 'products_detail_repo_imp_test.mocks.dart';

void main() {
  // Dummy Data for testing
  const String productId = '123';

  // Dummy product entity expected after converting the model.
  final ProductDetailsEntity dummyProductEntity = ProductDetailsEntity(
    id: productId,
    slug: 'Rose',
    price: 10.0,
    quantity: 5,
    description: 'Beautiful rose',
  );

  // Dummy model which is returned by the remote data source.
  // Its toEntity() method should return dummyProductEntity.
  final ProductsDetailsModels dummyProductModel = ProductsDetailsModels(
    id: productId,
    slug: 'Rose',
    price: 10.0,
    quantity: 5,
    description: 'Beautiful rose',
  );

  late ProductsDetailRepoImp repo;
  late MockProductsDetailsRemoteDataScource mockRemoteDataSource;

  setUp(() {
    // Create fresh instances of the mock and repository for each test.
    mockRemoteDataSource = MockProductsDetailsRemoteDataScource();
    repo = ProductsDetailRepoImp(mockRemoteDataSource);
  });

  group('getProductDetails', () {
    test(
      'returns Success with product details when remote data source succeeds',
      () async {
        // Arrange: Stub the remote data source to return our dummy model.
        when(mockRemoteDataSource.getProductDetails(productId))
            .thenAnswer((_) async => dummyProductModel);

        // Act: Call the repository method.
        final result = await repo.getProductDetails(productId);

        // Assert: Check that the result is a Success containing the expected entity.
        if (result is Success<ProductDetailsEntity>) {
          final data = result.data;
          expect(data!.id, equals(dummyProductEntity.id));
          expect(data.slug, equals(dummyProductEntity.slug));
          expect(data.price, equals(dummyProductEntity.price));
          expect(data.quantity, equals(dummyProductEntity.quantity));
          expect(data.description, equals(dummyProductEntity.description));
        } else if (result is Error<ProductDetailsEntity>) {
          fail('Expected Success but got Error');
        }
      },
    );

    test(
  'returns Error when remote data source throws an exception',
  () async {
    // Arrange: Simulate an exception from the remote data source.
    final exception = Exception('Failed to fetch');
    when(mockRemoteDataSource.getProductDetails(productId))
        .thenThrow(exception);

    // Act: Call the repository method.
    final result = await repo.getProductDetails(productId);

    // Assert: Check that the result is an Error containing the expected exception.
    if (result is Success<ProductDetailsEntity>) {
      fail('Expected Error but got Success');
    } else if (result is Error<ProductDetailsEntity>) {
      expect(result.exception.toString(), equals(exception.toString()));
    }
  },
);
  });
}
