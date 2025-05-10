import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';

import '../../../domain/entites/checkout_cash_response_entity.dart';

sealed class CheckoutState {}

class CheckoutInitialState extends CheckoutState {}

class CheckoutCreditLoadingState extends CheckoutState {}

class CheckoutCreditErrorState extends CheckoutState {
  final String errMessage;
  CheckoutCreditErrorState(this.errMessage);
}

class CheckoutCreditSuccessState extends CheckoutState {
  SessionResponseEntity creditCardResponseModel;
  CheckoutCreditSuccessState(this.creditCardResponseModel);
}

class CheckoutCashLoadingState extends CheckoutState {}

class CheckoutCashErrorState extends CheckoutState {
  final String errMessage;
  CheckoutCashErrorState(this.errMessage);
}

class CheckoutCashSuccessState extends CheckoutState {
  CheckoutOrderCashEntity checkoutCashResponseEntity;
  CheckoutCashSuccessState(this.checkoutCashResponseEntity);
}
