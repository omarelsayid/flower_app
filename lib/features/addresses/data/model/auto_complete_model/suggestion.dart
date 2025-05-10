import 'place_prediction.dart';

class Suggestion {
  PlacePrediction? placePrediction;

  Suggestion({this.placePrediction});

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
    placePrediction:
        json['placePrediction'] == null
            ? null
            : PlacePrediction.fromJson(
              json['placePrediction'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'placePrediction': placePrediction?.toJson(),
  };
}
