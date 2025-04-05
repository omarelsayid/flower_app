part of 'occasion_cubit.dart';

@immutable
sealed class OccasionState {}

final class OccasionInitial extends OccasionState {}
class OccasionLoading extends OccasionState{}
class OccasionSuccess extends OccasionState{
  final List<MasterEntity> occasions;

  OccasionSuccess(this.occasions);
}

class OccasionError extends OccasionState{
  final String message;

  OccasionError(this.message);
}