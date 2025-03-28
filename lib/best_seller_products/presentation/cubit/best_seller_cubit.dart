import 'package:flower_app/best_seller_products/domain/use_case/best_seller_use_case.dart';
import 'package:flower_app/best_seller_products/presentation/cubit/best_seller_state.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerState> {
  final BestSellerUseCase _bestSellerUseCase;
  BestSellerViewModel(this._bestSellerUseCase)
    : super(BestSellerInitialState());

  void getBestSeller() async {
    emit(BestSellerLoadingState());
    final result = await _bestSellerUseCase.getBestSeller();
    switch (result) {
      case Success():
        emit(BestSellerSuccessState(result.data!.bestSeller!));
      case Error():
        emit(BestSellerErrorState(result.exception!));
    }
  }
}
