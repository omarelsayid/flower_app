import 'package:flower_app/core/common/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/user_addresses_dto.dart';
import '../../domain/use_case/address_details_use_case.dart';
import 'address_details_states.dart';

@injectable
class AddressDetailsCubit extends Cubit<AddressDetailsStates> {
  AddressDetailsUseCase _addressDetailsUseCase;
  AddressDetailsCubit(this._addressDetailsUseCase)
    : super(AddressDetailsInitial());

  Future<void> saveUserAddress(AddressDTO addressDetailsModel) async {
    emit(AddressDetailsLoading());
    final result = await _addressDetailsUseCase.execute(addressDetailsModel);
    switch (result) {
      case Success():
        emit(AddressDetailsSuccess());
        break;
      case Error():
        emit(AddressDetailsError(error: result.exception.toString()));
        break;
    }
  }

  Future<void> updateUserAddress(AddressDTO addressDetailsModel) async {
    emit(AddressDetailsLoading());
    final result = await _addressDetailsUseCase.executeUpdate(
      addressDetailsModel,
    );
    switch (result) {
      case Success():
        emit(AddressDetailsSuccess());
        break;
      case Error():
        emit(AddressDetailsError(error: result.exception.toString()));
        break;
    }
  }
}
