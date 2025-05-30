import 'package:flower_app/features/orders/data/model/location_info.dart';
import 'package:flower_app/features/orders/data/model/route_modifiers.dart';
import 'package:flower_app/features/orders/domain/entites/route_entity.dart';
import 'package:flower_app/features/orders/domain/repo/routes_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/routes_api.dart';
import '../../../../core/services/location_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

@Injectable(as: RouteRepository)
class RouteRepositoryImpl implements RouteRepository {
  final LocationService _locationService;
  final RoutesApi _routesApi;

  RouteRepositoryImpl(this._locationService, this._routesApi);

  @override
  Future<RouteEntity> loadRoute({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? modifiers,
  }) async {
    // get location
    final locData = await _locationService.getUserLocation();
    final originInfo = origin; // أو قد تمرره
    final destInfo = destination;

    // get location from API
    final routesModel = await _routesApi.fetchRoutes(
      origin: originInfo,
      destination: destInfo,
      routeModifiers: modifiers,
    );

    //change polyLines --> .....
    final encoded = routesModel.routes?.first.polyline?.encodedPolyline ?? '';
    final points =
        PolylinePoints()
            .decodePolyline(encoded)
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList();

    // create markers
    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(locData.latitude!, locData.longitude!),
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: LatLng(
          destination.latLng.latitude,
          destination.latLng.longitude,
        ),
      ),
    };

    //create Polyline
    final polyline = Polyline(
      polylineId: const PolylineId('route'),
      points: points,
      width: 2,
    );

    // cal Bounds
    double minLat = points.first.latitude,
        maxLat = points.first.latitude,
        minLng = points.first.longitude,
        maxLng = points.first.longitude;
    for (final p in points) {
      minLat = math.min(minLat, p.latitude);
      maxLat = math.max(maxLat, p.latitude);
      minLng = math.min(minLng, p.longitude);
      maxLng = math.max(maxLng, p.longitude);
    }
    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    return RouteEntity(markers: markers, polyLines: {polyline}, bounds: bounds);
  }
}
