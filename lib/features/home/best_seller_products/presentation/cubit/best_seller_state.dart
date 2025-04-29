import 'package:flower_app/features/home/best_seller_products/data/model/ProductModel.dart';

sealed class BestSellerState {}

class BestSellerInitialState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final List<ProductModel> products;
  BestSellerSuccessState(this.products);
}

class BestSellerErrorState extends BestSellerState {
  final String error;
  BestSellerErrorState(this.error);
}
