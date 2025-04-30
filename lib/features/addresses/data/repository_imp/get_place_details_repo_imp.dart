import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/data_source/get_place_details_data_source.dart';
import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';
import 'package:flower_app/features/addresses/domain/repository/get_place_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetPlaceDetailsRepo)
class GetPlaceDetailsRepoImp implements GetPlaceDetailsRepo {
  final GetPlaceDetailsDataSource _placeDetailsDataSource;

  GetPlaceDetailsRepoImp(this._placeDetailsDataSource);

  @override
  Future<Result<PlaceDetailsModel>> getPlaceDetails(String placeId) {
    return executeApi<PlaceDetailsModel>(() async {
      PlaceDetailsModel placeDetailsModel = await _placeDetailsDataSource
          .getPlaceDetails(placeId);
      return placeDetailsModel;
    });
  }
}
