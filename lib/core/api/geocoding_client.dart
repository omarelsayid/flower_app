import 'package:dio/dio.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'geocoding_client.g.dart';

@RestApi(baseUrl: "https://maps.googleapis.com/maps/api/geocode/")
@singleton
@injectable
abstract class GeocodeApi {
  @factoryMethod
  factory GeocodeApi(Dio dio, {String baseUrl}) = _GeocodeApi;

  @GET("json")
  Future<AddressDetailsModel> getAddress({
    @Query("latlng") required String latlng,
    @Query("result_type") String resultType = "street_address",
    @Query("location_type") String locationType = "ROOFTOP",
    @Query("key") required String apiKey,
  });
}
