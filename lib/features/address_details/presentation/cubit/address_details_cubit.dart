import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/domain/repository/address_details_repo.dart';
import 'package:flower_app/features/address_details/presentation/cubit/address_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressDetailsCubit extends Cubit<AddressDetailsStates> {
  AddressDetailsRepo _addressDetailsRepo;
  AddressDetailsCubit(this._addressDetailsRepo)
    : super(AddressDetailsInitial());
  Future<void> saveUserAddress(AddressDetailsModel addressDetailsModel) async {
    emit(AddressDetailsLoading());
    final result = await _addressDetailsRepo.saveAddressDetails(
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
