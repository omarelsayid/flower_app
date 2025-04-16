import 'package:flower_app/core/api/geocoding_client.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_scource.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDetailsDataScource)
class AddressDetailsDataSourceImp implements AddressDetailsDataScource {
  final GeocodeApi _geocodeApi;

  AddressDetailsDataSourceImp(this._geocodeApi);

  @override
  Future<AddressDetailsModel> getAddressDetails(String latlng) async {
    AddressDetailsModel addressDetailsModel = await _geocodeApi.getAddress(
      latlng: latlng,
      apiKey: 'AIzaSyDTfammkGjt7pCFRQnMA_KOdl6Zwx6rWFE',
    );
    return addressDetailsModel;
  }
}
