import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_scource.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/domain/entities/address_details_entity.dart';
import 'package:flower_app/features/address_details/domain/repository/addres_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDetailsRepo)
class AddressDetailsRepoImp implements AddressDetailsRepo {
  final AddressDetailsDataScource _addressDetailsDataScource;

  AddressDetailsRepoImp(this._addressDetailsDataScource);
  @override
  Future<Result<AddressDetailsEntity>> getAddressDetails(String latlng) async {
    final result = await executeApi(() async {
      AddressDetailsModel addressDetailsModel = await _addressDetailsDataScource
          .getAddressDetails(latlng);

      return addressDetailsModel.toEntity();
    });
    return result;
  }
}
