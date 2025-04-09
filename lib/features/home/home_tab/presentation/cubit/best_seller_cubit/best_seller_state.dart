part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState{}
class BestSellerSuccess extends BestSellerState{
  final List<ProductModel> products;
  BestSellerSuccess(this.products);

}
class BestSellerError extends BestSellerState{
  final String error;

  BestSellerError(this.error);
}

