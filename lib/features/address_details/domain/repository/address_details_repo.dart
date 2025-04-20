import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';

abstract class AddressDetailsRepo {
  Future<Result> saveAddressDetails(AddressDetailsModel addressDetailsModel);
}
