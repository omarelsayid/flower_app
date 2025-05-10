import 'suggestion.dart';

class AutoCompleteModel {
  List<Suggestion>? suggestions;

  AutoCompleteModel({this.suggestions});

  factory AutoCompleteModel.fromJson(Map<String, dynamic> json) {
    return AutoCompleteModel(
      suggestions:
          (json['suggestions'] as List<dynamic>?)
              ?.map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'suggestions': suggestions?.map((e) => e.toJson()).toList(),
  };
}
