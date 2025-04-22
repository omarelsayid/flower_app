import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/addresses/data/data_source/address_details_data_source.dart';
import 'package:injectable/injectable.dart';

import '../model/user_addresses_dto.dart';

@Injectable(as: AddressDetailsDataSource)
class AddressDetailsDataSourceImp implements AddressDetailsDataSource {
  final ApiClient apiClient;
  AddressDetailsDataSourceImp(this.apiClient);

  @override
  Future<void> saveAddressDetails(AddressDTO addressDetailsModel) async {
    var token = await SharedPreferenceServices.getData(AppConstants.token.toString());

    if (addressDetailsModel.id != null) {
      await apiClient.updateAddress(
          addressDetailsModel.id!,
          addressDetailsModel.toJson(),
      );
    } else {
      await apiClient.saveUserAddress("Bearer $token", addressDetailsModel.toJson());
    }
  }

  @override
  Future<UserAddressesDTO> updateAddressDetails(AddressDTO addressDetailsModel) async {

    return await apiClient.updateAddress(
        addressDetailsModel.id!,
        addressDetailsModel.toJson(),
    );
  }
}
