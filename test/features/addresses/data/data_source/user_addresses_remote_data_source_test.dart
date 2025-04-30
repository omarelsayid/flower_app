import 'package:dio/dio.dart';
import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/features/addresses/data/data_source/user_addresses_remote_data_source.dart';
import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import 'user_addresses_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late UserAddressesRemoteDataSource dataSource;
  late ApiClient apiClient;
  var occasionResponse = UserAddressesDTO(
      address: [
        AddressDTO(
        id: "1",
        phone: "+967777555777",
        city: "Sanaa",
        street: "Street",
        username: "Faten",
        lat: "X",
        long: "Y"
      ),
        AddressDTO(
            id: "2",
            phone: "+967777555777",
            city: "Sanaa",
            street: "Street",
            username: "Fate",
            lat: "X",
            long: "Y"
        ),
        AddressDTO(
            id: "3",
            phone: "+967777555777",
            city: "Sanaa",
            street: "Street",
            username: "Fatenn",
            lat: "X",
            long: "Y"
        ),
      ]
  );

  setUp(() {
    apiClient = MockApiClient();
    dataSource = UserAddressesRemoteDataSourceImpl(apiClient);
  });

  group('occasion data source tests', () {

    test("when call getUserAddresses then "
        "It should return getUserAddresses from api"
        "and return correct output ", () async {

      when(apiClient.getUserAddresses())
          .thenAnswer((_) async => occasionResponse);

      var actual = await dataSource.getUserAddresses();

      verify(apiClient.getUserAddresses()).called(1);

      expect(actual, occasionResponse);

    }
    );

    test("when call deleteUserAddress then it should return deleted data", () async {
      const addressId = "2";

      final result = UserAddressesDTO(
        address: [
          AddressDTO(
              id: "1",
              phone: "+967777555777",
              city: "Sanaa",
              street: "Street",
              username: "Faten",
              lat: "X",
              long: "Y"
          ),
        ],
      );


      when(apiClient.deleteUserAddress(addressId))
          .thenAnswer((_) async => HttpResponse(result, Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
      )));
      final actual = await dataSource.deleteUserAddress(addressId);

      verify(apiClient.deleteUserAddress(addressId)).called(1);
      expect(actual, equals(result));
    });

  });
}