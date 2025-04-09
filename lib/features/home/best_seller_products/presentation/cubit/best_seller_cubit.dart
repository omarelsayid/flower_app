import 'dart:developer';

import 'package:flower_app/features/home/best_seller_products/domain/use_case/best_seller_use_case.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/cubit/best_seller_state.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerState> {
  final BestSellerUseCase _bestSellerUseCase;
  BestSellerViewModel(this._bestSellerUseCase)
    : super(BestSellerInitialState());

  void getBestSeller() async {
    log('loading');

    emit(BestSellerLoadingState());
    final result = await _bestSellerUseCase.getBestSeller();
    switch (result) {
      case Success():
        log('success');
        emit(BestSellerSuccessState(result.data!.bestSeller!));
      case Error():
        log('error');

        emit(BestSellerErrorState(result.exception!));
    }
  }
}
