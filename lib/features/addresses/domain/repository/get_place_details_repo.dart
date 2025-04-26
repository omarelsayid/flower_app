import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';

abstract class GetPlaceDetailsRepo {
  Future<Result<PlaceDetailsModel>> getPlaceDetails(String placeId);
}
