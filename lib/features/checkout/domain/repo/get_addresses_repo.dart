import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';

abstract class GetAddressesRepo {
  Future<Result<List<AddressEntity>>> getAddresses();
}
