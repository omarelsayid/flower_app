import 'package:flower_app/core/api/googel_maps_service.dart';
import 'package:flower_app/features/addresses/data/data_source/get_addresses_suggestion_data_source.dart';
import 'package:flower_app/features/addresses/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAddressesSuggestionDataSource)
class GetAddressesSuggestionDataSourceImp
    implements GetAddressesSuggestionDataSource {
  final GoogelMapsService _googelMapsService;

  GetAddressesSuggestionDataSourceImp(this._googelMapsService);

  @override
  Future<AutoCompleteModel> getSuggestions(String input) async {
    AutoCompleteModel suggestions = await _googelMapsService.getSuggestions(
      input,
    );
    return suggestions;
  }
}
