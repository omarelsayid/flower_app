import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/occasions/data/data_source/occasion_remote_data_source.dart';
import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/features/home/occasions/data/model/products_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late OccasionRemoteDataSource dataSource;
  late ApiClient apiClient;
  var occasionResponse = OccasionsResponseDTO(
      occasions: [OccasionDTO(
        id: "1",
        name: "Test Occasion",
        image: "test_image",
        productsCount: 25,
        slug: "Test Occasion",
      ),
        OccasionDTO(
          id: "2",
          name: "Test Occasion2",
          image: "test_image2",
          productsCount: 25,
          slug: "Test Occasion2",
        ),
        OccasionDTO(
          id: "3",
          name: "Test Occasion3",
          image: "test_image3",
          productsCount: 25,
          slug: "Test Occasion3",
        ),
      ]
  );
  var productsResponse = ProductsResponseDTO(

      products: [ProductsDTO(
        id: "1",

        title: "Test Products",
        imgCover: "test_images",
        price: 25,
        v: 20,
        slug: "Test Products",
      ),
        ProductsDTO(
          id: "2",
          title: "Test Products2",
          imgCover: "test_images2",
          price: 25,
          v: 20,
          slug: "Test Products2",
        ),
        ProductsDTO(
          id: "3",
          title: "Test Products3",
          imgCover: "test_image3",
          price: 25,
          v: 20,
          slug: "Test Products3",
        ),
      ]
  );

  setUp(() {
    apiClient = MockApiClient();
    dataSource = OccasionRemoteDataSourceImpl(apiClient);
  });

  group('occasion data source tests', () {

    test("when call getOccasion then "
        "It should return getOccasion from api"
        "and return correct output ", () async {

      when(apiClient.getOccasions())
          .thenAnswer((_) async => occasionResponse);

      var actual = await dataSource.getOccasion();

      verify(apiClient.getOccasions()).called(1);

      expect(actual, occasionResponse);

    }
    );

    test("when call getOccasionDetails then "
        "It should return getProductsByOccasion from api"
        "and return correct output ", () async {
    var occasionId = "2";
      when(apiClient.getProductsByOccasion(occasionId))
          .thenAnswer((_) async => productsResponse);

      var actual = await dataSource.getOccasionDetails(occasionId);

      verify(apiClient.getProductsByOccasion(occasionId)).called(1);

      expect(actual, productsResponse);

    }
    );

  });
}