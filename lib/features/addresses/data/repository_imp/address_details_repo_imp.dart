import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/data_source/address_details_data_source.dart';
import 'package:flower_app/features/addresses/domain/repository/address_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/user_addresses_entity.dart';
import '../model/user_addresses_dto.dart';

@Injectable(as: AddressDetailsRepo)
class AddressDetailsRepoImp implements AddressDetailsRepo {
  AddressDetailsDataSource addressDetailsDataSource;
  AddressDetailsRepoImp(this.addressDetailsDataSource);

  @override
  Future<Result> saveAddressDetails(AddressDTO addressDetailsModel) async {
    final Result result = await executeApi(() async {
      await addressDetailsDataSource.saveAddressDetails(addressDetailsModel);
    });
    return result;
  }

  @override
  Future<Result<UserAddressesEntity>> updateAddressDetails(AddressDTO addressDetailsModel) async {
    return await executeApi(
          () async {
        var result = await addressDetailsDataSource.updateAddressDetails(
            addressDetailsModel);
        return result;
      },
    );
  }
}