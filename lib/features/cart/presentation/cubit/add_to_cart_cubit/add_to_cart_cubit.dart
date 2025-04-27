import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preference_services.dart';
import '../../../../../core/utils/constant_manager.dart';
import '../../../domain/use_case/add_to_cart_use_case.dart';

part 'add_to_cart_state.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase _addToCartUseCase;
  AddToCartCubit(this._addToCartUseCase) : super(AddToCartInitial());
  Future<void> AddToCart({
    required String productId,
    required int quantity,
  }) async {
    if(!isClosed){
      emit(AddToCartLoading(productId));
    }

    try {
      final String token =
          await SharedPreferenceServices.getData(AppConstants.token).toString();
      final message = await _addToCartUseCase.execute(
        token: token,
        productId: productId,
        quantity: quantity,
      );
      emit(AddToCartSuccess(message, productId));
    } catch (e) {
      log(e.toString());
      emit(AddToCartError(e.toString(), productId));
    }
  }
}
