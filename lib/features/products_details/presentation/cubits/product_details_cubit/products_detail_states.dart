import 'package:flower_app/features/products_details/domain/entities/products_details_entity.dart';

sealed class ProductsDetailStates {}

final class ProductsDetailInitial extends ProductsDetailStates {}

final class ProductsDetailSuccess extends ProductsDetailStates {
  final ProductDetailsEntity productDetailsEntity;
  ProductsDetailSuccess(this.productDetailsEntity);
}

final class ProductsDetailError extends ProductsDetailStates {
  final String message;
  ProductsDetailError(this.message);
}

final class ProductsDetailLoading extends ProductsDetailStates {}
