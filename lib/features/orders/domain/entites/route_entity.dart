import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteEntity {
  final Set<Marker> markers;
  final Set<Polyline> polyLines;
  final LatLngBounds bounds;

  RouteEntity({
    required this.markers,
    required this.polyLines,
    required this.bounds,
  });
}