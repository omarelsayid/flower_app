import 'package:flower_app/core/common/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/update_quantity_use_case.dart';

part 'update_quantity_state.dart';

@injectable
class UpdateQuantityCubit extends Cubit<UpdateQuantityState> {
  UpdateQuantityCubit(this._updateCartQuantityUseCase)
    : super(UpdateQuantityInitial());
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;

  Future<void> updateQuantity(String id, int newQuantity) async {
    emit(UpdateQuantityLoading());
    final result = await _updateCartQuantityUseCase.execute(id, newQuantity);
    if (result is Success<String>) {
      if (result.data != null) {
        emit(UpdateQuantitySuccess(result.data!));
      } else {
        emit(UpdateQuantityError("No Message"));
      }
    } else if (result is Error<String>) {
      emit(UpdateQuantityError(result.exception!));
    }
  }
}
