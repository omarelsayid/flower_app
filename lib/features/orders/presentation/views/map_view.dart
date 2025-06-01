import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/services/firestore_service.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_icons.dart';
import 'package:flower_app/features/orders/data/model/driver_location_model.dart';
import 'package:flower_app/features/orders/data/model/location_info.dart';
import 'package:flower_app/features/orders/presentation/views/widgets/bottom_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubits/routes_cubit/routes_cubit.dart';
import '../cubits/routes_cubit/routes_state.dart';
import 'dart:async';

class RouteView extends StatefulWidget {
  const RouteView({super.key});

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  late GoogleMapController _mapController;
  final _initPos = const CameraPosition(target: LatLng(26.8, 30.8), zoom: 5);
  bool _isMapControllerReady = false;
  bool _hasAnimatedCamera = false;
  Timer? _locationUpdateTimer;

  @override
  void initState() {
    super.initState();
    _startPeriodicLocationUpdates();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCorrectRoute();
    });
  }

  @override
  void dispose() {
    _locationUpdateTimer?.cancel();
    super.dispose();
  }

  void _startPeriodicLocationUpdates() {
    _locationUpdateTimer = Timer.periodic(Duration(seconds: 20), (_) async {
      _loadCorrectRoute();
    });
  }

  Future<void> _loadCorrectRoute() async {
    Driver driver = await FireStoreService.getDriversOnce(
      "6819fabd1433a666c8d9d735",
    );

    final lat = driver.location.lat;
    final lng = driver.location.lng;

    final userLatLng = LatLngModel(latitude: lat, longitude: lng);

    context.read<RouteCubit>().loadRoute(driverLatLng: userLatLng);
  }

  void _tryAnimateToRouteBounds() {
    if (!_isMapControllerReady || _hasAnimatedCamera) return;

    final bounds = context.read<RouteCubit>().bounds;
    if (bounds != null) {
      _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      _hasAnimatedCamera = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RouteCubit, RouteState>(
        listener: (context, state) {
          if (state is RouteLoaded) {
            _tryAnimateToRouteBounds();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.8,
                child: StreamBuilder<Driver>(
                  stream: FireStoreService.driverCollectionStream(
                    "6819fabd1433a666c8d9d735",
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      final data = snapshot.data!;
                      final double lat = data.location.lat;
                      final double lng = data.location.lng;
                      final LatLng driverLatLng = LatLng(lat, lng);
                      final driverMarker = Marker(
                        markerId: MarkerId('destination'),
                        position: driverLatLng,
                      );

                      if (state is RouteLoaded) {
                        state.markers.removeWhere(
                          (m) => m.markerId.value == 'destination',
                        );
                        state.markers.add(driverMarker);
                      }
                    }

                    return GoogleMap(
                      initialCameraPosition: _initPos,
                      onMapCreated: (controller) {
                        _mapController = controller;
                        _isMapControllerReady = true;
                        _tryAnimateToRouteBounds();
                        _loadCorrectRoute();
                      },
                      markers: state is RouteLoaded ? state.markers : {},
                      polylines: state is RouteLoaded ? state.polyLines : {},
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 120,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: BottomInfoCard()),
            ],
          );
        },
      ),
    );
  }
}

///
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:tracking_app/core/api/routes_api.dart';
// import 'package:tracking_app/core/services/location_service.dart';
// import 'package:tracking_app/core/utils/app_colors.dart';
// import 'package:tracking_app/feature/order_details/data/models/location_info.dart';
// import 'package:tracking_app/feature/order_details/data/models/routes_model/routes_model.dart';
// import 'dart:math' as math;
//
// class RouteView extends StatefulWidget {
//   const RouteView({super.key});
//   @override
//   State<RouteView> createState() => _RouteViewState();
// }
//
// class _RouteViewState extends State<RouteView> {
//   late final CameraPosition cameraPosition;
//   late final LocationService _locationService;
//   late final GoogleMapController _mapController;
//   late AssetMapBitmap assetMapBitmap;
//   late final BitmapDescriptor _driverMarker;
//   late final BitmapDescriptor _userMarker;
//   late final BitmapDescriptor _flowerStoreMarker;
//
//   late final LocationData driverLocation;
//   late final RoutesApi routesApi;
//   final Set<Polyline> _polylines = {};
//   // late BitmapDescriptor _destinationMarker;
//   final LatLng _storeLocation = LatLng(31.201875670799417, 29.91034419386273);
//   final Set<Marker> _markers = {};
//   @override
//   void initState() {
//     super.initState();
//     _initCameraPosition();
//     _locationService = LocationService();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       polylines: _polylines,
//       markers: _markers,
//       onMapCreated: (controller) async {
//         _mapController = controller;
//         routesApi = RoutesApi();
//         await _initMapStyle();
//         _loadMarkerIcon();
//         await _moveToDriverLocation();
//         await path();
//       },
//       initialCameraPosition: cameraPosition,
//     );
//   }
//
//   void _initCameraPosition() {
//     cameraPosition = CameraPosition(
//       target: LatLng(23.580902573252857, 32.01367325581865),
//       zoom: 5,
//     );
//   }
//
//   Future<void> _moveToDriverLocation() async {
//     driverLocation = await _locationService.getUserLocation();
//     CameraPosition cameraPosition = CameraPosition(
//       target: LatLng(
//         driverLocation.latitude!,
//         driverLocation.longitude!,
//       ),
//       zoom: 16,
//     );
//     _mapController.animateCamera(CameraUpdate.newCameraPosition(
//       cameraPosition,
//     ));
//     Marker driverMarker = Marker(
//         markerId: MarkerId('driver'),
//         icon: _driverMarker,
//         position: LatLng(driverLocation.latitude!, driverLocation.longitude!));
//     _markers.add(driverMarker);
//     setState(() {});
//   }
//
//   Future<void> _initMapStyle() async {
//     final style = await DefaultAssetBundle.of(
//       context,
//     ).loadString('assets/map_styles/map_style.json');
//     _mapController.setMapStyle(style);
//   }
//
//   void _loadMarkerIcon() async {
//     // _markerBitmap = await BitmapDescriptor.Asset(
//     _driverMarker = await BitmapDescriptor.asset(
//       const ImageConfiguration(),
//       'assets/images/driver_location.png',
//     );
//     _flowerStoreMarker = await BitmapDescriptor.asset(
//       const ImageConfiguration(),
//       'assets/images/Flowery_location.png',
//     );
//
//     _userMarker = await BitmapDescriptor.asset(
//       const ImageConfiguration(),
//       'assets/images/user_location.png',
//     );
//   }
//
//   Future<List<LatLng>> getRoutesData() async {
//     LatLngModel orginLatLng = LatLngModel(
//       latitude: driverLocation.latitude!,
//       longitude: driverLocation.longitude!,
//     );
//     LatLngModel destinationLatLng = LatLngModel(
//       latitude: _storeLocation.latitude,
//       longitude: _storeLocation.longitude,
//     );
//     LocationInfo origin = LocationInfo(latLng: orginLatLng);
//     LocationInfo destination = LocationInfo(latLng: destinationLatLng);
//     RoutesModel routesModel = await routesApi.fetchRoutes(
//       origin: origin,
//       destination: destination,
//     );
//
//     return getDecodedRoute(routesModel);
//   }
//
//   List<LatLng> getDecodedRoute(RoutesModel routesModel) {
//     PolylinePoints polylinePoints = PolylinePoints();
//     List<PointLatLng> result = polylinePoints.decodePolyline(
//       routesModel.routes!.first.polyline!.encodedPolyline!,
//     );
//     log(routesModel.routes!.length.toString() +
//         "+++++++++++++++++++++++++++++++++++++++++++");
//     return result.map((e) => LatLng(e.latitude, e.longitude)).toList();
//   }
//
//   void displayRoutes(List<LatLng> point) {
//     Polyline routes = Polyline(
//       polylineId: PolylineId('route'),
//       color: AppColors.primaryColor,
//       width: 3,
//       points: point,
//     );
//     _polylines.add(routes);
//     LatLngBounds bounds = getLatLngBounds(point);
//     _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
//     Marker destinationMarker = Marker(
//       markerId: MarkerId('destination'),
//       icon: _flowerStoreMarker,
//       position: _storeLocation,
//     );
//     _markers.add(destinationMarker);
//     setState(() {});
//   }
//
//   LatLngBounds getLatLngBounds(List<LatLng> points) {
//     double sourthWestLatitude = points[0].latitude;
//     double sourthWestLongitude = points[0].longitude;
//     double northEastLatitude = points[0].latitude;
//     double northEastLongitude = points[0].longitude;
//     for (var point in points) {
//       sourthWestLatitude = math.min(sourthWestLatitude, point.latitude);
//       sourthWestLongitude = math.min(sourthWestLongitude, point.longitude);
//       northEastLatitude = math.max(northEastLatitude, point.latitude);
//       northEastLongitude = math.max(northEastLongitude, point.longitude);
//     }
//     return LatLngBounds(
//       southwest: LatLng(sourthWestLatitude, sourthWestLongitude),
//       northeast: LatLng(northEastLatitude, northEastLongitude),
//     );
//   }
//
//   Future<void> path() async {
//     List<LatLng> point = await getRoutesData();
//     displayRoutes(point);
//   }
// }
