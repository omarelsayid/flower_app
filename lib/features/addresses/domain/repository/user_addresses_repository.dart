import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import '../../../../core/common/result.dart';

abstract class UserAddressesRepository {
  Future<Result<UserAddressesEntity>> getUserAddresses();
  Future<Result<UserAddressesEntity>> deleteUserAddress(String id);
}
