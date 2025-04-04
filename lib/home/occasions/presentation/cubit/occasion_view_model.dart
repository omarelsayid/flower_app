import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/result.dart';
import '../../domain/use_case/occasion_use_case.dart';
import 'occasion_state.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionState> {
  OccasionViewModel(this._occasionUseCase) : super(LoadingOccasionState());

  final OccasionUseCase _occasionUseCase;
  String? selectedOccasionId;

  void doIntent(OccasionIntent occasionIntent) {
    switch (occasionIntent) {
      case OccasionClickedIntent():
        _getOccasion();
        break;
      case SpecificOccasionClickedIntent(:final occasionId):
        selectedOccasionId = occasionId;
        _getSpecificOccasion(occasionId);
        break;
    }
  }

  Future<void> _getOccasion() async {
    EasyLoading.show(status: "Loading...");
    emit(LoadingOccasionState());

    var result = await _occasionUseCase.execute();
    EasyLoading.dismiss();

    switch (result) {
      case Success():
        if (result.data != null) {
          final occasionsResponse = result.data!;
          final occasionsList = occasionsResponse.occasions ?? [];

          if (occasionsList.isEmpty) {
            emit(ErrorOccasionState("No occasions available"));
          } else {
            emit(SuccessOccasionState(occasionsList));
            log("Fetched ${occasionsList.length} occasions successfully.");
          }
        } else {
          emit(ErrorOccasionState("Failed to fetch occasions: No data received"));
        }
        break;

      case Error():
        emit(ErrorOccasionState(result.exception.toString()));
        log("Occasions API Error: ${result.exception}");
        break;
    }
  }

  Future<void> _getSpecificOccasion(String occasionId) async {
    EasyLoading.show();
    emit(LoadingOccasionState());

    var result = await _occasionUseCase.executeSpecific(occasionId);
    EasyLoading.dismiss();

    switch (result) {
      case Success():
        if (result.data != null) {
          final occasionsResponse = result.data!;
          final specificOccasionsList = occasionsResponse.products ?? [];

          if (specificOccasionsList.isEmpty) {
            emit(ErrorOccasionState("No specific occasions available"));
          } else {
            emit(SuccessSpecificOccasionState(specificOccasionsList));
            log("Fetched ${specificOccasionsList.length} specific occasions successfully.");
          }
        } else {
          emit(ErrorOccasionState("Failed to fetch specific occasions: No data received"));
        }
        break;

      case Error():
        emit(ErrorOccasionState(result.exception.toString()));
        log("Specific Occasions API Error: ${result.exception}");
        break;
    }
  }
}

sealed class OccasionIntent {}

class OccasionClickedIntent extends OccasionIntent {}

class SpecificOccasionClickedIntent extends OccasionIntent {
  final String occasionId;
  SpecificOccasionClickedIntent(this.occasionId);
}

