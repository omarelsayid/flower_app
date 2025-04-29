import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';

sealed class GetAddressesStates {}

class GetAddressesInitialState extends GetAddressesStates {}

class GetAddressesLoadingState extends GetAddressesStates {}

class GetAddressesSuccessState extends GetAddressesStates {
  final List<AddressEntity> addresses;
  GetAddressesSuccessState(this.addresses);
}

class GetAddressesErrorState extends GetAddressesStates {
  final String error;
  GetAddressesErrorState(this.error);
}
