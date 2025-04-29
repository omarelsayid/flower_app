import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';

sealed class UserAddressesState {}

class LoadingUserAddressesState extends UserAddressesState {}

class SuccessUserAddressesState extends UserAddressesState {
  final List<Address> data;
  final String? deletingId;

  SuccessUserAddressesState(this.data, {this.deletingId});
}

class ErrorUserAddressesState extends UserAddressesState {
  final String message;
  ErrorUserAddressesState(this.message);
}
