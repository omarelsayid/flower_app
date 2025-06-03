import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class RouteState {}

class RouteInitial extends RouteState {}

class RouteLoading extends RouteState {}

class RouteLoaded extends RouteState {
  final Set<Marker> markers;
  final Set<Polyline> polyLines;
  final LatLngBounds bounds;

  RouteLoaded({required this.markers, required this.polyLines, required this.bounds});
  // RouteLoaded({required this.markers, required this.polyLines});
}

class RouteError extends RouteState {
  final String message;
  RouteError(this.message);
}
