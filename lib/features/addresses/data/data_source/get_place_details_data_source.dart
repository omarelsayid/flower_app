import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';

abstract class GetPlaceDetailsDataSource {
  Future<PlaceDetailsModel> getPlaceDetails(String placeId);
}
