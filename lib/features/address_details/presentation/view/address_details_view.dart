import 'package:flower_app/core/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddressDetailsView extends StatefulWidget {
  const AddressDetailsView({super.key});

  @override
  State<AddressDetailsView> createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  @override
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  void initState() {
    // TODO: implement initState
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(30.760183897535462, 27.20908716756562),
      zoom: 5.3,
    );

    locationService = LocationService();
  }

  void getUserLOcation() async {
    try {
      LocationData locationData = await locationService.getUserLocation();
      LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);
      CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
      Marker locationMarker = Marker(markerId: MarkerId("1"), position: latLng);
      markers.add(locationMarker);
      setState(() {});
    } on LocationServiceException catch (e) {
      // TODO
    } on LocationPermissionException catch (e) {
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      onMapCreated: (controller) {
        mapController = controller;
        getUserLOcation();
      },
      initialCameraPosition: initialCameraPosition,
      zoomControlsEnabled: false,
    );
  }
}
