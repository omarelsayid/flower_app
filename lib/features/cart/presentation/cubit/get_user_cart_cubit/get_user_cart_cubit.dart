import 'dart:developer';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';
import 'package:flower_app/features/cart/domain/use_case/get_user_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_user_cart_state.dart';

@injectable
class GetUserCartCubit extends Cubit<GetUserCartState> {
  GetUserCartCubit(this.getUserCartUseCase) : super(GetUserCartInitial());
  final GetUserCartUseCase getUserCartUseCase;

  Future<void> GetUserCart() async {
    emit(GetUserCartLoading());

    log("I am in get user cart function");
    try {
      final result = await getUserCartUseCase.getUserCart();

      if (result is Success<UserCartEntity>) {
        if (result.data != null) {
          final cartData = result.data!;
          log("Number of Cart Items: ${cartData.numOfCartItems}");
          log("User: ${cartData.cart.user}");
          log("Total Items in the cart: ${cartData.cart.cartItems.length}");

          // Safely log the first item's product title (if there is an item)
          if (cartData.cart.cartItems.isNotEmpty) {
            log(
              "First Product Title: ${cartData.cart.cartItems[0].product.title}",
            );
          } else {
            log("Cart is empty, no product to log.");
          }
          emit(GetUserCartSuccess(cartData));
        } else {
          log("Data is null");
          emit(GetUserCartError("Empty"));
        }
      } else if (result is Error<UserCartEntity>) {
        log("Error in get cart: ${result.exception!}");
        emit(GetUserCartError(result.exception!));
      }
    } catch (e) {
      emit(GetUserCartError(e.toString()));
    }
  }
}
