import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:flower_app/features/checkout/data/model/credit_card_request_model.dart';
import 'package:flower_app/features/checkout/domain/entites/checkout_cash_response_entity.dart';
import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';
import 'package:flower_app/features/checkout/domain/repo/checkout_credit_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutCreditRepo)
class CheckoutCreditRepoImpl implements CheckoutCreditRepo {
  final CheckoutRemoteDataSource _dataSource;

  CheckoutCreditRepoImpl(this._dataSource);

  @override
  Future<Result<CreditCardResponseEntity>> checkoutCredit(
    CreditCardRequestModel data,
  ) async {
    return await _dataSource.checkoutCredit(data);
  }

  @override
  Future<Result<CheckoutCashResponseEntity>> checkoutCash(
    CreditCardRequestModel data,
  ) {
    return _dataSource.checkoutCash(data);
  }
}
