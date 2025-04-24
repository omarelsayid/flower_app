class DisplayName {
  String? text;

  DisplayName({this.text});

  factory DisplayName.fromJson(Map<String, dynamic> json) =>
      DisplayName(text: json['text'] as String?);

  Map<String, dynamic> toJson() => {'text': text};
}
