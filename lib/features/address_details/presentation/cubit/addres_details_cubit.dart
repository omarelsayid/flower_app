import 'dart:developer';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/address_details/domain/repository/addres_details_repo.dart';
import 'package:flower_app/features/address_details/presentation/cubit/addres_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddresDetailsCubit extends Cubit<AddresDetailsStates> {
  final AddressDetailsRepo _addressDetailsRepo;
  AddresDetailsCubit(this._addressDetailsRepo) : super(AddresDetailsInitial());

  void getAddressDetails(String latlng) async {
    emit(AddresDetailsLoading());
    final result = await _addressDetailsRepo.getAddressDetails(latlng);
    switch (result) {
      case Success():
        log('success ++++++++++++++++++++++' + result.data!.address!);
        emit(AddresDetailsSuccess(result.data!));
      case Error():
        emit(AddresDetailsError(result.exception!));
    }
  }
}
