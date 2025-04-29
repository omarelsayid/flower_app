import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/data/data_source/get_addresses_suggestion_data_source.dart';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:flower_app/features/addresses/domain/repository/get_addresses_suggestion_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAddressesSuggestionRepo)
class GetAddressesSuggestionRepoImp implements GetAddressesSuggestionRepo {
  final GetAddressesSuggestionDataSource _suggestionDataSource;

  GetAddressesSuggestionRepoImp(this._suggestionDataSource);
  @override
  Future<Result<AutoCompleteModel>> getAddressesSuggestion(String input) async {
    return executeApi<AutoCompleteModel>(() async {
      final AutoCompleteModel result = await _suggestionDataSource
          .getSuggestions(input);
      return result;
    });
  }
}
