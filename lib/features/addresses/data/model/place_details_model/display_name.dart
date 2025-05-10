class DisplayName {
  String? text;
  String? languageCode;

  DisplayName({this.text, this.languageCode});

  factory DisplayName.fromJson(Map<String, dynamic> json) => DisplayName(
    text: json['text'] as String?,
    languageCode: json['languageCode'] as String?,
  );

  Map<String, dynamic> toJson() => {'text': text, 'languageCode': languageCode};
}
