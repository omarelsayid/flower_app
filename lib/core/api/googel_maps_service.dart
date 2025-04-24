import 'dart:convert';
import 'dart:developer';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
@singleton
class GoogelMapsService {
  final String _apiKey = 'AIzaSyDAJUH2ToscE1dmRxM93HssJGctBhrUkRQ';
  Future<AutoCompleteModel> getSuggestions(String input) async {
    final String baseUrl =
        'https://places.googleapis.com/v1/places:autocomplete?key=$_apiKey';
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      body: {'input': input, "languageCode": "en", "regionCode": "EG"},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AutoCompleteModel.fromJson(data);
    } else {
      throw Exception('Failed to load suggestions ${response.statusCode}');
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails(String placeId) async {
    String baseUrl = 'https://places.googleapis.com/v1/places';

    // ** fields that will come from the response
    String fields = 'displayName,formattedAddress,location';

    String url = '$baseUrl/$placeId?fields=id,$fields&key=$_apiKey';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log(data.toString() + "++++++++++++++++++++++++++++++++++");
      return PlaceDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
}
