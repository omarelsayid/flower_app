import 'dart:developer';

import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/addresses/data/data_source/get_place_details_data_source.dart';
import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';
import 'package:flower_app/features/addresses/domain/repository/get_place_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetPlaceDetailsRepo)
class GetPlaceDetailsRepoImp implements GetPlaceDetailsRepo {
  final GetPlaceDetailsDataSource _placeDetailsDataSource;

  GetPlaceDetailsRepoImp(this._placeDetailsDataSource);

  @override
  Future<Result<Map<String, dynamic>>> getPlaceDetails(String placeId) {
    return executeApi<Map<String, dynamic>>(() async {
      PlaceDetailsModel placeDetailsModel = await _placeDetailsDataSource
          .getPlaceDetails(placeId);
      List formattedAddress = placeDetailsModel.formattedAddress!.split(",");
      Map<String, dynamic> placeDetailsMap = {};

      log(
        formattedAddress.length.toString() + "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
      );
      if (formattedAddress.length == 4) {
        placeDetailsMap[AppConstants.locationKey] = placeDetailsModel.location;
        placeDetailsMap[AppConstants.addressKey] = formattedAddress[0];
        placeDetailsMap[AppConstants.cityKey] = formattedAddress[3];
        placeDetailsMap[AppConstants.areaKey] = formattedAddress[2];
        return placeDetailsMap;
      } else {
        placeDetailsMap['location'] = placeDetailsModel.location;
        placeDetailsMap['address'] = formattedAddress[0];
        placeDetailsMap['city'] = formattedAddress[1];
        placeDetailsMap['area'] = formattedAddress[2];
        return placeDetailsMap;
      }
      // return Success(data: placeDetailsMap);
    });
  }
}
