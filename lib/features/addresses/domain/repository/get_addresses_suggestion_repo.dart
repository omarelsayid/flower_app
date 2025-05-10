import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';

abstract class GetAddressesSuggestionRepo {
  Future<Result<AutoCompleteModel>> getAddressesSuggestion(String input);
}
