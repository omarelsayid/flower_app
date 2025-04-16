import 'dart:developer';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/services/location_service.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/address_details/presentation/cubit/addres_details_cubit.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailsViewBody extends StatefulWidget {
  const AddressDetailsViewBody({super.key});

  @override
  State<AddressDetailsViewBody> createState() => _AddressDetailsViewBodyState();
}

class _AddressDetailsViewBodyState extends State<AddressDetailsViewBody> {
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

  void initMapStyle() async {
    var mapStyle = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/map_style.json');
    mapController.setMapStyle(mapStyle);
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

       context.read<AddresDetailsCubit>().getAddressDetails(
        '${latLng.latitude},${latLng.longitude}',
      );

      // final placemarks = await placemarkFromCoordinates(
      //   latLng.latitude,
      //   latLng.longitude,
      // );
      // if (placemarks.isNotEmpty) {
      //   final place = placemarks.first;
      //   _addressController.text = place.locality!;
      //   _cityController.text = place.administrativeArea!;
      //   _areaController.text = place.subAdministrativeArea!;
      // }
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
    return Padding(
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
                  onMapCreated: (controller) async {
                    mapController = controller;
                    getUserLocation();
                    initMapStyle();
                  },
                  initialCameraPosition: initialCameraPosition,
                  zoomControlsEnabled: false,
                ),
              ),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: S.of(context).enterAddress,
                labelText: S.of(context).address,
              ),
            ),

            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: S.of(context).enterPhoneNumber,
                labelText: S.of(context).phoneNumber,
              ),
            ),

            TextFormField(
              controller: _receipentNameController,
              decoration: InputDecoration(
                hintText: S.of(context).enterRecipientName,
                labelText: S.of(context).recipientName,
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
                      hintText: S.of(context).cairo,
                      labelText: S.of(context).city,
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

                      hintText: S.of(context).october,
                      labelText: S.of(context).area,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: resposiveHeight(24)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                S.of(context).saveAddress,
                style: AppTextStyles.roboto500_16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
