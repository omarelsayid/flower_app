import 'dart:developer';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:flower_app/features/addresses/domain/repository/get_addresses_suggestion_repo.dart';
import 'package:flower_app/features/addresses/presentation/cubit/get_addresses_suggestio_cubit/get_addresses_suggestio_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressesSuggestioCubit extends Cubit<GetAddressesSuggestioStates> {
  final GetAddressesSuggestionRepo _addressesSuggestionRepo;
  GetAddressesSuggestioCubit(this._addressesSuggestionRepo)
    : super(GetAddressesSuggestioLoadingState());

  void getAddressSuggestion(String input) async {
    Result<AutoCompleteModel> result = await _addressesSuggestionRepo
        .getAddressesSuggestion(input);
    switch (result) {
      case Success():
        log(
          result.data!.suggestions![0].placePrediction!.text!.text.toString() +
              "#################################",
        );
        emit(GetAddressesSuggestioSuccessState(result.data!.suggestions!));
      case Error():
        emit(GetAddressesSuggestioErrorState(result.exception!.toString()));
    }
  }
}
