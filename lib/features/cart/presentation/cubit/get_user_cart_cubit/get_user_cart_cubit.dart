import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';
import 'package:flower_app/features/cart/domain/use_case/get_user_cart_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'get_user_cart_state.dart';

@injectable
class GetUserCartCubit extends Cubit<GetUserCartState> {
  GetUserCartCubit(this.getUserCartUseCase) : super(GetUserCartInitial());
  final GetUserCartUseCase getUserCartUseCase;

  Future<void> GetUserCart()async{

    emit(GetUserCartLoading());

    log("i am in get user cart function ");
    try{
      final result = await getUserCartUseCase.getUserCart();

      if(result is Success<UserCartEntity>){
        if(result.data !=null)
          {
            final cartData= result.data!;
            log("The Data of User Cart is");
            log("${cartData.numOfCartItems}");
            log("${cartData.cart.user}");
            log("Total Items in the cart");
            log("${cartData.cart.cartItems.length}");
            log("${cartData.cart.cartItems[0].product.title}");
            emit(GetUserCartSuccess(cartData));
          }
        else {
          log("i am in error ");
          emit(GetUserCartError("Empty"));
        }
      }

      else if(result is Error<UserCartEntity>)
        {
          log("i am in error 2");
          log(result.exception!);
          emit(GetUserCartError(result.exception!));
        }

    }catch(e)
    {
      emit(GetUserCartError(e.toString()));
    }
  }
}
