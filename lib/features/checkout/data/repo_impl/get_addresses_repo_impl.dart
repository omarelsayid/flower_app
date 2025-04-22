import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';
import 'package:flower_app/features/checkout/domain/repo/get_addresses_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAddressesRepo)
class GetAddressesRepoImpl implements GetAddressesRepo {
  final CheckoutRemoteDataSource _checkoutRemoteDataSource;
  GetAddressesRepoImpl(this._checkoutRemoteDataSource);
  @override
  Future<Result<List<AddressEntity>>> getAddresses() async {
    return await executeApi(() async {
      String token =
          SharedPreferenceServices.getData(AppConstants.token) as String;
      final response = await _checkoutRemoteDataSource.getAddresses(
        'Bearer $token',
      );
      return response.addresses!.map((e) => e.toEntity()).toList();
    });
  }
}
