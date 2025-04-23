import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';

abstract class GetAddressesSuggestionDataSource {
  Future<AutoCompleteModel> getSuggestions(String input);
}
