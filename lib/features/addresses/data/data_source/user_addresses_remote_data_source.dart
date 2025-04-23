import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_client.dart';

abstract class UserAddressesRemoteDataSource {
  Future<UserAddressesDTO> getUserAddresses();
  Future<UserAddressesDTO> deleteUserAddress(String id);
}

@Injectable(as: UserAddressesRemoteDataSource)
class UserAddressesRemoteDataSourceImpl
    implements UserAddressesRemoteDataSource {
  final ApiClient _apiClient;
  UserAddressesRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserAddressesDTO> getUserAddresses() async {
    return await _apiClient.getUserAddresses();
  }

  @override
  Future<UserAddressesDTO> deleteUserAddress(String id) async {
    final response = await _apiClient.deleteUserAddress(id);
    return response.data;
  }
}
