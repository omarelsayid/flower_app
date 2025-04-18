import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';
import 'package:flower_app/features/checkout/domain/repo/get_addresses_repo.dart';

class GetAddressesUseCase {
  final GetAddressesRepo _getAddressesRepo;
  GetAddressesUseCase(this._getAddressesRepo);

  Future<Result<List<AddressEntity>>> execute() async {
    return await _getAddressesRepo.getAddresses();
  }
}
