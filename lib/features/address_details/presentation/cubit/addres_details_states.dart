import 'package:flower_app/features/address_details/domain/entities/address_details_entity.dart';

sealed class AddresDetailsStates {}

final class AddresDetailsInitial extends AddresDetailsStates {}

final class AddresDetailsLoading extends AddresDetailsStates {}

final class AddresDetailsSuccess extends AddresDetailsStates {
  final AddressDetailsEntity addressDetailsEntity;
  AddresDetailsSuccess(this.addressDetailsEntity);
}

final class AddresDetailsError extends AddresDetailsStates {
  final String message;
  AddresDetailsError(this.message);
}
