import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/data/model/addresses_response_dto.dart';
import 'package:flower_app/features/checkout/data/model/credit_card_request_model.dart';
import 'package:flower_app/features/checkout/domain/entites/checkout_cash_response_entity.dart';
import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';

abstract class CheckoutRemoteDataSource {
  Future<AddressesResponseDTO> getAddresses(String token);
  Future<Result<CreditCardResponseEntity>> checkoutCredit(CreditCardRequestModel data);
  Future<Result<CheckoutCashResponseEntity>> checkoutCash(CreditCardRequestModel data);
}
