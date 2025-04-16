import 'package:flower_app/features/address_details/data/models/address_details_model.dart';

abstract class AddressDetailsDataScource {
  Future<AddressDetailsModel> getAddressDetails(String latlng);
}
