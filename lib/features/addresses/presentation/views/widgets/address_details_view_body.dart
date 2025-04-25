import 'dart:developer';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/services/localization_service.dart';
import 'package:flower_app/core/services/location_service.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/suggestion.dart';
import 'package:flower_app/features/addresses/domain/entity/city_entity.dart';
import 'package:flower_app/features/addresses/domain/entity/states_entity.dart';
import 'package:flower_app/features/addresses/presentation/cubit/get_addresses_suggestio_cubit/get_addresses_suggestio_cubit.dart';
import 'package:flower_app/features/addresses/presentation/cubit/get_addresses_suggestio_cubit/get_addresses_suggestio_states.dart';
import 'package:flower_app/features/addresses/presentation/cubit/place_details_cubit/place_details_cubit.dart';
import 'package:flower_app/features/addresses/presentation/cubit/place_details_cubit/place_details_states.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/user_addresses_dto.dart';
import '../../cubit/address_details_cubit.dart';
import '../../cubit/address_details_states.dart';

class AddressDetailsViewBody extends StatefulWidget {
  final AddressDTO initialAddress;
  const AddressDetailsViewBody({Key? key, required this.initialAddress})
    : super(key: key);

  @override
  State<AddressDetailsViewBody> createState() => _AddressDetailsViewBodyState();
}

class _AddressDetailsViewBodyState extends State<AddressDetailsViewBody> {
  late AddressDTO addressDetailsModel;
  late CameraPosition _initialCameraPosition;
  late LocationService _locationService;
  late GoogleMapController _mapController;
  bool get isEditMode => addressDetailsModel.id != null;

  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _areaController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _recipientController;

  final AutovalidateMode validateMode = AutovalidateMode.disabled;
  late AssetMapBitmap assetMapBitmap;
  late BitmapDescriptor _markerBitmap;
  Set<Marker> _markers = {};
  List<Suggestion> _suggestions = [];

  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  String? selectedState;

  @override
  void initState() {
    super.initState();
    addressDetailsModel = widget.initialAddress;
    _streetController = TextEditingController(text: addressDetailsModel.street);
    _phoneNumberController = TextEditingController(
      text: addressDetailsModel.phone,
    );
    _recipientController = TextEditingController(
      text: addressDetailsModel.username,
    );
    _cityController = TextEditingController(text: addressDetailsModel.city);
    _areaController = TextEditingController();
    _initialCameraPosition = const CameraPosition(
      target: LatLng(23.580902573252857, 32.01367325581865),
      zoom: 4,
    );
    _locationService = LocationService();
    _loadMarkerIcon();

    // _setupSearchListener();
  }

  // void _setupSearchListener() {
  //   _streetController.addListener(() {
  //     String query = _streetController.text.trim();
  //     if (query.isNotEmpty) {
  //       context.read<GetAddressesSuggestioCubit>().getAddressSuggestion(query);
  //     }
  //   });
  // }

  void _loadMarkerIcon() async {
    // _markerBitmap = await BitmapDescriptor.Asset(
    _markerBitmap = await BitmapDescriptor.asset(
      const ImageConfiguration(),
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

      final places = await placemarkFromCoordinates(
        target.latitude,
        target.longitude,
      );
      if (places.isNotEmpty) {
        final place = places.length > 1 ? places[1] : places.first;
        _streetController.text = place.street ?? '';
        _cityController.text = place.administrativeArea ?? '';
        _areaController.text = place.subAdministrativeArea ?? '';
        addressDetailsModel = addressDetailsModel.copyWith(
          lat: target.latitude.toString(),
          long: target.longitude.toString(),
          street: _streetController.text,
          city: _cityController.text,
        );
      }

      Marker marker = Marker(
        markerId: const MarkerId('1'),
        position: target,
        icon: _markerBitmap,
      );
      _markers.add(marker);
      setState(() {});
      log(
        _markers.length.toString() +
            "#############################################",
      );
    } catch (e) {
      log('Error in moveToAndPopulate: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String locale = context.watch<LocaleProvider>().locale.languageCode;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: resposiveWidth(343),
                height: resposiveHeight(145),
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  markers: _markers,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) {
                    _mapController = controller;
                    _moveToUserLocation();
                    _initMapStyle();
                  },
                  onTap: _moveToAndPopulate,
                ),
              ),
              SizedBox(height: resposiveHeight(24)),
              BlocListener<
                GetAddressesSuggestioCubit,
                GetAddressesSuggestioStates
              >(
                listener: (context, state) {
                  if (state is GetAddressesSuggestioSuccessState) {
                    _suggestions = state.data;
                    setState(() {});
                  }
                },
                child: _buildField(
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {
                      context
                          .read<GetAddressesSuggestioCubit>()
                          .getAddressSuggestion(p0);
                      setState(() {});
                    } else {
                      _suggestions = [];
                      setState(() {});
                    }
                  },
                  _streetController,
                  S.of(context).address,
                  S.of(context).enterAddress,
                  S.of(context).addressRequired,
                ),
              ),
              if (_suggestions.isNotEmpty)
                _customSearchListView()
              else
                SizedBox.shrink(),
              SizedBox(height: resposiveHeight(24)),
              _buildField(
                _phoneNumberController,
                S.of(context).phoneNumber,
                S.of(context).enterPhoneNumber,
                S.of(context).phoneNumberRequired,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: resposiveHeight(24)),
              _buildField(
                _recipientController,
                S.of(context).recipientName,
                S.of(context).enterRecipientName,
                S.of(context).recipientNameRequired,
              ),
              SizedBox(height: resposiveHeight(24)),
              BlocListener<PlaceDetailsCubit, PlaceDetailsStates>(
                listener: (context, state) {
                  if (state is PlaceDetailsSuccess) {
                    placeDetailSuccessState(state);
                  }
                },
                child: Row(
                  children: [
                    // First Dropdown with fixed size
                    SizedBox(
                      width: 163,
                      height: 56,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: SvgPicture.asset(
                          SvgImages.dropDownIcon,
                          fit: BoxFit.scaleDown,
                        ),
                        hint: Text('city'),
                        value: selectedCity,
                        items:
                            cities.map((state) {
                              return DropdownMenuItem<String>(
                                value:
                                    locale == 'en'
                                        ? state.governorateNameEn
                                        : state.governorateNameAr,
                                child: Text(
                                  locale == 'en'
                                      ? state.governorateNameEn
                                      : state.governorateNameAr,
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value;
                          });
                        },
                      ),
                    ),

                    // SizedBox between dropdowns
                    SizedBox(width: 17),

                    // Second Dropdown with same size
                    SizedBox(
                      width: 163,
                      height: 56,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: SvgPicture.asset(
                          SvgImages.dropDownIcon,
                          fit: BoxFit.scaleDown,
                        ),
                        hint: Text('Area'),
                        value: selectedState,
                        items:
                            states.map((state) {
                              return DropdownMenuItem<String>(
                                value:
                                    locale == 'en'
                                        ? state.cityNameEn
                                        : state.cityNameAr,
                                child: Text(
                                  locale == 'en'
                                      ? state.cityNameEn
                                      : state.cityNameAr,
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: resposiveHeight(24)),
              BlocListener<AddressDetailsCubit, AddressDetailsStates>(
                listener: (context, state) => _handleStates(state),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isEditMode ? _updateAddress : _saveAddress,
                    child: Text(
                      isEditMode ? 'updateAddress' : S.of(context).saveAddress,
                      style: AppTextStyles.roboto500_16.copyWith(
                        color: Colors.white,
                      ),
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

  void placeDetailSuccessState(PlaceDetailsSuccess state) {
    Map placeDetailsMap = state.placeDetailsMap;
    _cityController.text = placeDetailsMap['city'];
    _areaController.text = placeDetailsMap['area'];
    _streetController.text = placeDetailsMap['address'];
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            placeDetailsMap['location'].latitude,
            placeDetailsMap['location'].longitude,
          ),
          zoom: 16,
        ),
      ),
    );
    Marker marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(
        placeDetailsMap['location'].latitude,
        placeDetailsMap['location'].longitude,
      ),
      icon: _markerBitmap,
    );
    _markers.add(marker);
    setState(() {});

    addressDetailsModel.copyWith(
      city: _cityController.text,
      street: _streetController.text,
      lat: placeDetailsMap['location'].latitude.toString(),
      long: placeDetailsMap['location'].longitude.toString(),
    );
  }

  Container _customSearchListView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final suggestion = _suggestions[index];
          return ListTile(
            onTap: () async {
              await context
                  .read<PlaceDetailsCubit>()
                  .getPlaceDetails(suggestion.placePrediction!.placeId!)
                  .then(
                    (value) => setState(() {
                      _suggestions = [];
                    }),
                  );
            },
            leading: const Icon(
              Icons.location_pin,
              color: AppColors.primaryColor,
            ),
            title: Text(suggestion.placePrediction!.text!.text.toString()),
          );
        },
        separatorBuilder: (context, index) => Divider(height: 0),
        itemCount: _suggestions.length,
      ),
    );
  }

  void _handleStates(AddressDetailsStates state) {
    switch (state) {
      case AddressDetailsLoading():
        EasyLoading.show();
        break;
      case AddressDetailsSuccess():
        EasyLoading.dismiss();
        EasyLoading.showSuccess(S.of(context).addressSavedSuccessfully);
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pop(context, true),
        );
        break;
      case AddressDetailsError():
        EasyLoading.showError(state.error);
        break;
      default:
        break;
    }
  }

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) return;
    addressDetailsModel = addressDetailsModel.copyWith(
      street: _streetController.text,
      phone: _phoneNumberController.text,
      username: _recipientController.text,
      city: _cityController.text,
    );
    context.read<AddressDetailsCubit>().saveUserAddress(addressDetailsModel);
  }

  void _updateAddress() {
    if (!_formKey.currentState!.validate()) return;
    addressDetailsModel = addressDetailsModel.copyWith(
      street: _streetController.text,
      phone: _phoneNumberController.text,
      username: _recipientController.text,
      city: _cityController.text,
    );
    context.read<AddressDetailsCubit>().updateUserAddress(addressDetailsModel);
  }

  Future<void> _moveToUserLocation() async {
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

  String? _fieldValidator(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
    String hint,
    String validatorMsg, {
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: (v) => (v == null || v.trim().isEmpty) ? validatorMsg : null,
    );
  }
}
