import 'package:flower_app/features/addresses/domain/use_case/user_addresses_use_case.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/user_addresses_entity.dart';

@injectable
class UserAddressesViewModel extends Cubit<UserAddressesState> {
  final UserAddressesUseCase _useCase;
  UserAddressesViewModel(this._useCase) : super(LoadingUserAddressesState());

  void doIntent(UserAddressesIntent intent) {
    switch (intent) {

      case GetUserAddressesClickedIntent():
        _getUserAddresses();
        break;

      case DeleteUserAddressClickedIntent():
          _deleteAddress(intent.id);

    }
  }

  Future<void> _getUserAddresses() async {
    emit(LoadingUserAddressesState());
    final result = await _useCase.execute();
    switch (result) {
      case Success():
        emit(SuccessUserAddressesState(result.data!.addresses ?? []));
      case Error():
        emit(ErrorUserAddressesState(result.exception!));
    }
  }

  Future<void> _deleteAddress(String id) async {
    final current = state is SuccessUserAddressesState
        ? (state as SuccessUserAddressesState).data
        : <Address>[];

    emit(SuccessUserAddressesState(current.cast<Address>(), deletingId: id));

    final result = await _useCase.executeDeletion(id);
    switch (result) {
      case Success():
        final updated = current.where((e) => e.id != id).toList();
        emit(SuccessUserAddressesState(updated));
      case Error():
        emit(SuccessUserAddressesState(current));
        emit(ErrorUserAddressesState(result.exception!));
    }
  }

}

sealed class UserAddressesIntent {}

class GetUserAddressesClickedIntent extends UserAddressesIntent {}
class DeleteUserAddressClickedIntent extends UserAddressesIntent {
  final String id;
  DeleteUserAddressClickedIntent(this.id);
}
