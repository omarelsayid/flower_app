import 'package:flower_app/features/address_details/data/models/address_details_model.dart';

abstract class AddressDetailsDataSource {
  Future<void> saveAddressDetails(AddressDetailsModel addressDetailsModel);
}
