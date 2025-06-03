class RouteModifiers {
  final bool avoidTolls;
  final bool avoidHighways;
  final bool avoidFerries;

  RouteModifiers({
    required this.avoidTolls,
    required this.avoidHighways,
    required this.avoidFerries,
  });

  factory RouteModifiers.fromJson(Map<String, dynamic> json) {
    return RouteModifiers(
      avoidTolls: json['avoidTolls'] ?? false,
      avoidHighways: json['avoidHighways'] ?? false,
      avoidFerries: json['avoidFerries'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avoidTolls': avoidTolls,
      'avoidHighways': avoidHighways,
      'avoidFerries': avoidFerries,
    };
  }
}