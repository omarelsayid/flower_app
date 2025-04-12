part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState{}
class AddToCartError extends AddToCartState{
  final String error;

  AddToCartError(this.error);
}
class AddToCartSuccess extends AddToCartState{
  final String message;

  AddToCartSuccess(this.message);
}

