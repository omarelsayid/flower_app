import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_source.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/domain/repository/address_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDetailsRepo)
class AddressDetailsRepoImp implements AddressDetailsRepo {
  AddressDetailsDataSource addressDetailsDataSource;
  AddressDetailsRepoImp(this.addressDetailsDataSource);

  @override
  Future<Result> saveAddressDetails(
    AddressDetailsModel addressDetailsModel,
  ) async {
    final Result result = await executeApi(() async {
      await addressDetailsDataSource.saveAddressDetails(addressDetailsModel);
    });
    return result;
  }
}
