import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/common/result.dart';
import '../../../domain/entity/category_entity.dart';
import '../../../domain/user_case/home_use_case.dart';

part 'occasion_state.dart';

@injectable
class OccasionCubit extends Cubit<OccasionState> {
  OccasionCubit(this.getCategoriesUseCase) : super(OccasionInitial());
  final HomeUseCase getCategoriesUseCase;

  Future<void> fetchOccasion() async {
    if (isClosed) return;
    emit(OccasionLoading());

    final result = await getCategoriesUseCase.executeOccasion();
    switch (result) {
      case Success():
        if (result.data != null) {
          if (isClosed) return;
          emit(OccasionSuccess(result.data!));
        }

      case Error():
        log("error ${result.exception.toString()}");
        if (isClosed) return;
        emit(OccasionError(result.exception.toString()));
    }
  }
}
