import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/domain/use_case/get_addreses_use_case.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressesViewModel extends Cubit<GetAddressesStates> {
  final GetAddressesUseCase _getAddressesUseCase;
  GetAddressesViewModel(this._getAddressesUseCase)
    : super(GetAddressesInitialState());

  Future<void> getAddresses() async {
    emit(GetAddressesLoadingState());
    final result = await _getAddressesUseCase.execute();
    switch (result) {
      case Success():
        emit(GetAddressesSuccessState(result.data ?? []));
      case Error():
        emit(GetAddressesErrorState(result.exception ?? ''));
    }
  }
}
