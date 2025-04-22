import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/data/model/credit_card_request_model.dart';
import 'package:flower_app/features/checkout/domain/entites/checkout_cash_response_entity.dart';
import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';
import 'package:flower_app/features/checkout/domain/repo/checkout_credit_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutCreditUseCase {
  final CheckoutCreditRepo _checkoutCreditRepo;

  CheckoutCreditUseCase(this._checkoutCreditRepo);

  Future<Result<CreditCardResponseEntity>> callCredit(
    CreditCardRequestModel data,
  ) async {
    return await _checkoutCreditRepo.checkoutCredit(data);
  }

  Future<Result<CheckoutCashResponseEntity>> executeCash(
    CreditCardRequestModel data,
  ) async {
    return await _checkoutCreditRepo.checkoutCash(data);
  }
}
