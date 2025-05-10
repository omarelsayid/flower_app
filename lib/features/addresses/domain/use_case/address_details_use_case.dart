import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flower_app/features/addresses/domain/repository/address_details_repo.dart';

import '../../../../core/common/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressDetailsUseCase {
  final AddressDetailsRepo _addressRepository;

  AddressDetailsUseCase(this._addressRepository);

  Future<Result> execute(AddressDTO addressDetailsModel) async {
    return await _addressRepository.saveAddressDetails(addressDetailsModel);
  }

  Future<Result<UserAddressesEntity>> executeUpdate(AddressDTO address) async {
    return await _addressRepository.updateAddressDetails(address);
  }
}
