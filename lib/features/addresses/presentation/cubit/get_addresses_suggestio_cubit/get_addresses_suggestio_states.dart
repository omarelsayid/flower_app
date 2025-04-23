import 'package:flower_app/features/addresses/data/model/auto_complete_model/suggestion.dart';

sealed class GetAddressesSuggestioStates {}

final class GetAddressesSuggestioLoadingState
    extends GetAddressesSuggestioStates {}

final class GetAddressesSuggestioSuccessState
    extends GetAddressesSuggestioStates {
  final List<Suggestion> data;
  GetAddressesSuggestioSuccessState(this.data);
}

final class GetAddressesSuggestioErrorState
    extends GetAddressesSuggestioStates {
  final String message;
  GetAddressesSuggestioErrorState(this.message);
}
