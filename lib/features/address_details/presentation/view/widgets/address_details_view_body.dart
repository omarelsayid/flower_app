import 'dart:developer';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/services/location_service.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/presentation/cubit/address_details_cubit.dart';
import 'package:flower_app/features/address_details/presentation/cubit/address_details_states.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailsViewBody extends StatefulWidget {
  const AddressDetailsViewBody({super.key});

  @override
  State<AddressDetailsViewBody> createState() => _AddressDetailsViewBodyState();
}

class _AddressDetailsViewBodyState extends State<AddressDetailsViewBody> {
  late CameraPosition _initialCameraPosition;
  late LocationService _locationService;
  late GoogleMapController _mapController;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final AddressDetailsModel addressDetailsModel = AddressDetailsModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode validateMode = AutovalidateMode.disabled;
  late AssetMapBitmap assetMapBitmap;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = const CameraPosition(
      target: LatLng(23.580902573252857, 32.01367325581865),
      zoom: 4,
    );
    _locationService = LocationService();
    customMarker();
  }

  customMarker() async {
    assetMapBitmap = await BitmapDescriptor.asset(
      ImageConfiguration(),
      IconAssets.markerIcon,
    );
  }

  Future<void> _initMapStyle() async {
    final style = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/map_style.json');
    _mapController.setMapStyle(style);
  }

  Future<void> _moveToAndPopulate(LatLng target) async {
    try {
      await _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: target, zoom: 16),
        ),
      );

      final placemarks = await placemarkFromCoordinates(
        target.latitude,
        target.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.length > 1 ? placemarks[1] : placemarks.first;
        _addressController.text = '${place.street ?? ''},';
        _cityController.text = place.administrativeArea ?? '';
        _areaController.text = place.subAdministrativeArea ?? '';

        addressDetailsModel.lat = target.latitude.toString();
        addressDetailsModel.long = target.longitude.toString();
        addressDetailsModel.street = _addressController.text;
        addressDetailsModel.city = _cityController.text;
      }

      _markers = {
        Marker(
          markerId: const MarkerId('selected'),
          position: target,
          icon: assetMapBitmap,
        ),
      };
      setState(() {});
    } catch (e) {
      log('Error in moveToAndPopulate: $e');
    }
  }

  Future<void> _getUserLocation() async {
    try {
      final locData = await _locationService.getUserLocation();
      final latLng = LatLng(locData.latitude!, locData.longitude!);
      await _moveToAndPopulate(latLng);
    } on LocationServiceException catch (e) {
      log('Location service error: $e');
    } on LocationPermissionException catch (e) {
      log('Location permission error: $e');
    } catch (e) {
      log('Unknown error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: validateMode,
      child: Padding(
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
                    initialCameraPosition: _initialCameraPosition,
                    markers: _markers,
                    zoomControlsEnabled: false,
                    onMapCreated: (controller) {
                      _mapController = controller;
                      _getUserLocation();
                      _initMapStyle();
                    },
                    onTap: _moveToAndPopulate,
                  ),
                ),
              ),
              TextFormField(
                validator:
                    (value) =>
                        _fieldValidator(value, S.of(context).addressRequired),
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: S.of(context).enterAddress,
                  labelText: S.of(context).address,
                ),
              ),
              TextFormField(
                validator:
                    (value) => _fieldValidator(
                      value,
                      S.of(context).phoneNumberRequired,
                    ),
                onChanged: (value) => addressDetailsModel.phone = value,
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: S.of(context).enterPhoneNumber,
                  labelText: S.of(context).phoneNumber,
                ),
              ),
              TextFormField(
                validator:
                    (value) => _fieldValidator(
                      value,
                      S.of(context).recipientNameRequired,
                    ),
                onChanged: (value) => addressDetailsModel.userName = value,
                controller: _recipientController,
                decoration: InputDecoration(
                  hintText: S.of(context).enterRecipientName,
                  labelText: S.of(context).recipientName,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator:
                          (value) => _fieldValidator(
                            value,
                            S.of(context).cityRequired,
                          ),
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
                      validator:
                          (value) => _fieldValidator(
                            value,
                            S.of(context).areaRequired,
                          ),
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
              BlocListener<AddressDetailsCubit, AddressDetailsStates>(
                listener: (context, state) {
                  _handleStates(state);
                },
                child: ElevatedButton(
                  onPressed: () async {
                    _saveAddress();
                  },
                  child: Text(
                    S.of(context).saveAddress,
                    style: AppTextStyles.roboto500_16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleStates(AddressDetailsStates state) {
    switch (state) {
      case AddressDetailsLoading():
        EasyLoading.show();
        break;
      case AddressDetailsSuccess():
        EasyLoading.showSuccess(S.of(context).addressSavedSuccessfully);
        break;
      case AddressDetailsError():
        EasyLoading.showError(state.error);
        break;
      default:
        break;
    }
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      context
          .read<AddressDetailsCubit>()
          .saveUserAddress(addressDetailsModel)
          .then((context) {
            log('Address saved');
          });
    }
  }

  String? _fieldValidator(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
