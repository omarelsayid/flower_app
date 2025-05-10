import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_app/features/home/best_seller_products/data/model/ProductModel.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../best_seller_products/domain/use_case/best_seller_use_case.dart';
import '../../../../../../core/common/result.dart';

part 'best_seller_state.dart';

@injectable
class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this._bestSellerUseCase) : super(BestSellerInitial());
  final BestSellerUseCase _bestSellerUseCase;

  void getBestSeller() async {
    log('loading');

    emit(BestSellerLoading());
    final result = await _bestSellerUseCase.getBestSeller();
    if(isClosed)
      {
        return;
      }
    switch (result) {
      case Success():
        log('success');
        emit(BestSellerSuccess(result.data!.bestSeller!));
      case Error():
        log('error');

        emit(BestSellerError(result.exception!));
    }
  }
}
