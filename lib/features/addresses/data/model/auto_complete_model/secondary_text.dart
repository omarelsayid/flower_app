class SecondaryText {
  String? text;

  SecondaryText({this.text});

  factory SecondaryText.fromJson(Map<String, dynamic> json) =>
      SecondaryText(text: json['text'] as String?);

  Map<String, dynamic> toJson() => {'text': text};
}
