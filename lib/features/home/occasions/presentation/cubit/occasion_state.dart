import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';

sealed class OccasionState {}

class LoadingOccasionState extends OccasionState {}

class SuccessOccasionState extends OccasionState {
  final List<Occasion?> occasion;
  SuccessOccasionState(this.occasion);
}

class ErrorOccasionState extends OccasionState {
  final String message;
  ErrorOccasionState(this.message);
}

class SuccessSpecificOccasionState extends OccasionState {
  final List<Products> specificOccasion;
  SuccessSpecificOccasionState(this.specificOccasion);
}

class ChangeOccasionIndexState extends OccasionState {}
