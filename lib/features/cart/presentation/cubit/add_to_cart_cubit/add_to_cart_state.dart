part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {
  final String id;
  AddToCartLoading(this.id);
}

class AddToCartError extends AddToCartState {
  final String error;
  final String id;

  AddToCartError(this.error, this.id);
}

class AddToCartSuccess extends AddToCartState {
  final String message;
  final String id;
  AddToCartSuccess(this.message, this.id);
}
