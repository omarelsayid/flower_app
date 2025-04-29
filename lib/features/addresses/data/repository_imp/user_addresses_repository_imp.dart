import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_execute.dart';
import '../../../../core/common/result.dart';
import '../../domain/repository/user_addresses_repository.dart';
import '../data_source/user_addresses_remote_data_source.dart';

@Injectable(as: UserAddressesRepository)
class UserAddressesRepositoryImpl implements UserAddressesRepository {
  final UserAddressesRemoteDataSource _userAddressesRemoteDataSource;

  UserAddressesRepositoryImpl(this._userAddressesRemoteDataSource);

  @override
  Future<Result<UserAddressesEntity>> getUserAddresses() async {
    return await executeApi(() async {
      var result = await _userAddressesRemoteDataSource.getUserAddresses();
      return result;
    });
  }

  @override
  Future<Result<UserAddressesEntity>> deleteUserAddress(String id) async {
    return executeApi(() async {
      final result = await _userAddressesRemoteDataSource.deleteUserAddress(id);
      return result;
    });
  }
}
