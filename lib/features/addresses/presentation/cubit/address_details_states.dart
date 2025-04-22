sealed class AddressDetailsStates {}

class AddressDetailsInitial extends AddressDetailsStates {}

class AddressDetailsLoading extends AddressDetailsStates {}

class AddressDetailsSuccess extends AddressDetailsStates {}

class AddressDetailsError extends AddressDetailsStates {
  final String error;

  AddressDetailsError({required this.error});
}
