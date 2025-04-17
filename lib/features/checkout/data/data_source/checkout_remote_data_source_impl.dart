import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:flower_app/features/checkout/data/model/addresses_response_dto.dart';
import 'package:retrofit/dio.dart';

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiClient _apiClient;
  CheckoutRemoteDataSourceImpl(this._apiClient);

  @override
  Future<AddressesResponseDTO> getAddresses(String token) async {
    HttpResponse response = await _apiClient.getAddresses(token);
    return response.data;
  }
}
