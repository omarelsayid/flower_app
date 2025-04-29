part of 'delete_specific_item_cubit.dart';

@immutable
sealed class DeleteSpecificItemState {}

final class DeleteSpecificItemInitial extends DeleteSpecificItemState {}

class DeleteSpecificItemLoading extends DeleteSpecificItemState {}

class DeleteSpecificItemError extends DeleteSpecificItemState {
  final String error;

  DeleteSpecificItemError(this.error);
}

class DeleteSpecificItemSuccess extends DeleteSpecificItemState {
  final String message;

  DeleteSpecificItemSuccess(this.message);
}
