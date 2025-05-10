import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_case/delete_use_case.dart';

part 'delete_specific_item_state.dart';

@injectable
class DeleteSpecificItemCubit extends Cubit<DeleteSpecificItemState> {
  DeleteSpecificItemCubit(this._deleteUseCase)
    : super(DeleteSpecificItemInitial());

  final DeleteUseCase _deleteUseCase;

  Future<void> deleteSpecificItem(String id) async {
    emit(DeleteSpecificItemLoading());
    final result = await _deleteUseCase.execute(id);

    if (result is Success<String>) {
      emit(DeleteSpecificItemSuccess(result.data!));
    } else if (result is Error<String>) {
      log("error from delete cubit is ${result.exception}");
      emit(DeleteSpecificItemError(result.exception!));
    }
  }
}
