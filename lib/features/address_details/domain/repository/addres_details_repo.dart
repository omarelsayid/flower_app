import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/domain/entities/address_details_entity.dart';

abstract class AddressDetailsRepo {
  Future<Result<AddressDetailsEntity>> getAddressDetails(String latlng);
}
