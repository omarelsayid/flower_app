import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flower_app/features/addresses/domain/repository/user_addresses_repository.dart';

import '../../../../core/common/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserAddressesUseCase {
  final UserAddressesRepository _userAddressesRepository;

  UserAddressesUseCase(this._userAddressesRepository);

  Future<Result<UserAddressesEntity>> execute() async{
    return await _userAddressesRepository.getUserAddresses();
  }
  Future<Result<UserAddressesEntity>> executeDeletion(String id) {
    return _userAddressesRepository.deleteUserAddress(id);
  }

}
