import 'dart:developer';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/services/location_service.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
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
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _receipentNameController =
      TextEditingController();
  Set<Marker> markers = {};
  void initState() {
    // TODO: implement initState
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(30.760183897535462, 27.20908716756562),
      zoom: 4,
    );

    locationService = LocationService();
  }

  Future<void> getUserLocation() async {
    try {
      final locationData = await locationService.getUserLocation();
      final latLng = LatLng(locationData.latitude!, locationData.longitude!);

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 13),
        ),
      );

      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        _addressController.text = place.locality!;
        _cityController.text = place.administrativeArea!;
        _areaController.text = place.subAdministrativeArea!;
        String address =
            "${place.name}, ${place.street}, ${place.locality}, "
            "${place.administrativeArea}, ${place.country}";
      }
      markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
      setState(() {});
    } on LocationServiceException catch (e) {
      log("Location service error: $e");
    } on LocationPermissionException catch (e) {
      log("Location permission error: $e");
    } catch (e) {
      log("Unknown error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: "Address",
        isVisible: true,
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
        child: SingleChildScrollView(
          child: Column(
            spacing: resposiveHeight(24),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: resposiveWidth(343),
                  height: resposiveHeight(145),
                  child: GoogleMap(
                    markers: markers,
                    onMapCreated: (controller) {
                      mapController = controller;
                      getUserLocation();
                    },
                    initialCameraPosition: initialCameraPosition,
                    zoomControlsEnabled: false,
                  ),
                ),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: "enter your address",
                  labelText: "address",
                ),
              ),

              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  hintText: "Enter your phone number",
                  labelText: "phone number",
                ),
              ),

              TextFormField(
                controller: _receipentNameController,
                decoration: const InputDecoration(
                  hintText: "enter the recipient name",
                  labelText: "Recipient name",
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          SvgImages.dropDownIcon,
                          width: resposiveWidth(16),
                          height: resposiveHeight(16),
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "cairo",
                        labelText: "city",
                      ),
                    ),
                  ),
                  SizedBox(width: resposiveWidth(17)),
                  Expanded(
                    child: TextFormField(
                      controller: _areaController,
                      decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          SvgImages.dropDownIcon,
                          width: resposiveWidth(16),
                          height: resposiveHeight(16),
                          fit: BoxFit.scaleDown,
                        ),

                        hintText: "October",
                        labelText: "Area",
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: resposiveHeight(24)),
              ElevatedButton(onPressed: () {}, child: Text('')),
            ],
          ),
        ),
      ),
    );
  }
}
