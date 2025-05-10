import 'package:flower_app/features/addresses/data/model/place_details_model/place_details_model.dart';

sealed class PlaceDetailsStates {}

class PlaceDetailsInitial extends PlaceDetailsStates {}

class PlaceDetailsLoading extends PlaceDetailsStates {}

class PlaceDetailsSuccess extends PlaceDetailsStates {
  final PlaceDetailsModel placeDetails;

  PlaceDetailsSuccess({required this.placeDetails});
}

class PlaceDetailsError extends PlaceDetailsStates {
  final String message;

  PlaceDetailsError({required this.message});
}
