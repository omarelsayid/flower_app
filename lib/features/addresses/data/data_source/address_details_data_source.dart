import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';

abstract class AddressDetailsDataSource {
    Future<void> saveAddressDetails(AddressDTO addressDetailsModel);
  Future<UserAddressesDTO> updateAddressDetails(AddressDTO addressDetailsModel);
}
