import 'package:flower_app/features/checkout/data/model/addresses_response_dto.dart';

abstract class CheckoutRemoteDataSource {
  Future<AddressesResponseDTO> getAddresses(String token);
}
