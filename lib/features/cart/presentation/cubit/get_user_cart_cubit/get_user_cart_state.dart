part of 'get_user_cart_cubit.dart';

@immutable
sealed class GetUserCartState {}

final class GetUserCartInitial extends GetUserCartState {}

class GetUserCartSuccess extends GetUserCartState {
  final UserCartEntity userCartEntity;

  GetUserCartSuccess(this.userCartEntity);
}

class GetUserCartLoading extends GetUserCartState {}

class GetUserCartError extends GetUserCartState {
  final String error;

  GetUserCartError(this.error);
}
