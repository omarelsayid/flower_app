import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailsView extends StatefulWidget {
  const AddressDetailsView({super.key});

  @override
  State<AddressDetailsView> createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  @override
  late CameraPosition initialCameraPosition;
  void initState() {
    // TODO: implement initState
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(30.760183897535462, 27.20908716756562),
      zoom: 5.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      zoomControlsEnabled: false,
    );
  }
}
