import 'main_text.dart';
import 'secondary_text.dart';

class StructuredFormat {
  MainText? mainText;
  SecondaryText? secondaryText;

  StructuredFormat({this.mainText, this.secondaryText});

  factory StructuredFormat.fromJson(Map<String, dynamic> json) {
    return StructuredFormat(
      mainText:
          json['mainText'] == null
              ? null
              : MainText.fromJson(json['mainText'] as Map<String, dynamic>),
      secondaryText:
          json['secondaryText'] == null
              ? null
              : SecondaryText.fromJson(
                json['secondaryText'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'mainText': mainText?.toJson(),
    'secondaryText': secondaryText?.toJson(),
  };
}
