import 'package:flutter/material.dart';

class AddressDetailsStates {
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final double? lat;
  final double? long;
  final String? currentAddressId;

  AddressDetailsStates({
    required this.usernameController,
    required this.phoneController,
    required this.cityController,
    required this.streetController,
    this.lat,
    this.long,
    this.currentAddressId,
  });
}
extension AddressDetailsStatesCopyWith on AddressDetailsStates {
  AddressDetailsStates copyWith({
    TextEditingController? usernameController,
    TextEditingController? phoneController,
    TextEditingController? cityController,
    TextEditingController? streetController,
    double? lat,
    double? long,
    String? currentAddressId,
  }) {
    return AddressDetailsStates(
      usernameController: usernameController ?? this.usernameController,
      phoneController: phoneController ?? this.phoneController,
      cityController: cityController ?? this.cityController,
      streetController: streetController ?? this.streetController,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      currentAddressId: currentAddressId ?? this.currentAddressId,
    );
  }
}