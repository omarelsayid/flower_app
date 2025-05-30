import 'dart:convert';
import 'dart:developer';
import 'package:flower_app/features/orders/data/model/location_info.dart';
import 'package:flower_app/features/orders/data/model/route_modifiers.dart';
import 'package:flower_app/features/orders/data/model/routes_model/routes_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class RoutesApi {
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  final String _apiKey = 'AIzaSyA58V9xiOqj_f8bCkjNxnUl4G5Jf86kRtc';
  Future<RoutesModel> fetchRoutes({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? routeModifiers,
  }) async {
    Uri url = Uri.parse(baseUrl);
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': '$_apiKey',
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
    };
    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers":
          routeModifiers != null
              ? routeModifiers.toJson()
              : {
                "avoidTolls": false,
                "avoidHighways": false,
                "avoidFerries": false,
              },
      "languageCode": "en-US",
      "units": "IMPERIAL",
    };
    http.Response response = await http.post(
      url,
      headers: header,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log(
        data.toString() +
            "++++++++++++++++++++++++++++++++WWWWWWWWWWWWWWWWWWWWWWWWWWWWW",
      );
      return RoutesModel.fromJson(data);
    } else {
      log(response.body.toString());
      throw Exception('no routes found');
    }
  }
}
