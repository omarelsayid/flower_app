import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_source.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDetailsDataSource)
class AddressDetailsDataSourceImp implements AddressDetailsDataSource {
  ApiClient apiClient;
  AddressDetailsDataSourceImp(this.apiClient);
  @override
  Future<void> saveAddressDetails(
    AddressDetailsModel addressDetailsModel,
  ) async {
    var token = SharedPreferenceServices.getData(AppConstants.token.toString());
    await apiClient.saveUserAddress("Bearer $token",addressDetailsModel);
  }
}
