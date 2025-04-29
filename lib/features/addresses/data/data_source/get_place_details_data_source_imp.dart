import 'package:flower_app/core/api/googel_maps_service.dart';
import 'package:flower_app/features/addresses/data/data_source/get_place_details_data_source.dart';
import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetPlaceDetailsDataSource)
class GetPlaceDetailsDataSourceImp implements GetPlaceDetailsDataSource {
  final GoogelMapsService _mapsService;

  GetPlaceDetailsDataSourceImp(this._mapsService);

  @override
  Future<PlaceDetailsModel> getPlaceDetails(String placeId) async {
    return _mapsService.getPlaceDetails(placeId);
  }
}
