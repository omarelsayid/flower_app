part of 'update_quantity_cubit.dart';

@immutable
sealed class UpdateQuantityState {}

final class UpdateQuantityInitial extends UpdateQuantityState {}

class UpdateQuantityLoading extends UpdateQuantityState {}

class UpdateQuantitySuccess extends UpdateQuantityState {
  final String message;

  UpdateQuantitySuccess(this.message);
}

class UpdateQuantityError extends UpdateQuantityState {
  final String error;

  UpdateQuantityError(this.error);
}
