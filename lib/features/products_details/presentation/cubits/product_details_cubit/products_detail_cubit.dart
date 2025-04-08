import 'dart:developer';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/products_details/domain/entities/products_details_entity.dart';
import 'package:flower_app/features/products_details/domain/repositories/get_product_details_repo.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsDetailCubit extends Cubit<ProductsDetailStates> {
  final GetProductDetailsRepo getProductDetailsRepo;
  ProductsDetailCubit(this.getProductDetailsRepo)
    : super(ProductsDetailInitial());

  Future<void> getProductDetails(String id) async {
    emit(ProductsDetailLoading());
    final Result<ProductDetailsEntity> result = await getProductDetailsRepo
        .getProductDetails(id);
    switch (result) {
      case Success():
        emit(ProductsDetailSuccess(result.data!));
        log(
          'success ++++++++++++++++++++++' + result.data!.quantity.toString(),
        );
      case Error():
        emit(ProductsDetailError(result.exception!));
    }
  }
}
