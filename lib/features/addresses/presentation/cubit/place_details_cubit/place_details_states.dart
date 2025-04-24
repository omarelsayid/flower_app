sealed class PlaceDetailsStates {}

class PlaceDetailsInitial extends PlaceDetailsStates {}

class PlaceDetailsLoading extends PlaceDetailsStates {}

class PlaceDetailsSuccess extends PlaceDetailsStates {
  final Map<String, dynamic> placeDetailsMap;

  PlaceDetailsSuccess({required this.placeDetailsMap});
}

class PlaceDetailsError extends PlaceDetailsStates {
  final String message;

  PlaceDetailsError({required this.message});
}
