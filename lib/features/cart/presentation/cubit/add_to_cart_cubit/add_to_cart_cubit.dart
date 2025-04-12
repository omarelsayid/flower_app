import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/add_to_cart_use_case.dart';

part 'add_to_cart_state.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {

  final AddToCartUseCase _addToCartUseCase;
  AddToCartCubit(this._addToCartUseCase) : super(AddToCartInitial());
  Future<void> createCart({
    required String token,
    required String productId,
    required int quantity,
  }) async {
    emit(AddToCartLoading());
    try {
      final message = await _addToCartUseCase.execute(
        token: token,
        productId: productId,
        quantity: quantity,
      );
      emit(AddToCartSuccess(message));
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

}
