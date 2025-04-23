import 'match.dart';

class Text {
  String? text;
  List<Match>? matches;

  Text({this.text, this.matches});

  factory Text.fromJson(Map<String, dynamic> json) => Text(
    text: json['text'] as String?,
    matches:
        (json['matches'] as List<dynamic>?)
            ?.map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'matches': matches?.map((e) => e.toJson()).toList(),
  };
}
