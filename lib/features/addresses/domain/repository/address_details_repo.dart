import 'package:flower_app/core/common/result.dart';

import '../../data/model/user_addresses_dto.dart';
import '../entity/user_addresses_entity.dart';

abstract class AddressDetailsRepo {
  Future<Result> saveAddressDetails(AddressDTO addressDetailsModel);
  Future<Result<UserAddressesEntity>> updateAddressDetails(
    AddressDTO addressDetailsModel,
  );
}
