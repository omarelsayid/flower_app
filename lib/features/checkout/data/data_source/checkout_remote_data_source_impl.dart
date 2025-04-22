import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:flower_app/features/checkout/data/model/addresses_response_dto.dart';
import 'package:flower_app/features/checkout/data/model/credit_card_request_model.dart';
import 'package:flower_app/features/checkout/domain/entites/checkout_cash_response_entity.dart';
import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';

import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';

@Injectable(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiClient _apiClient;

  CheckoutRemoteDataSourceImpl(this._apiClient);

  var token = SharedPreferenceServices.getData(AppConstants.token.toString());

  @override
  Future<AddressesResponseDTO> getAddresses(String token) async {
    HttpResponse response = await _apiClient.getAddresses(token);
    return response.data;
  }

  @override
  Future<Result<CreditCardResponseEntity>> checkoutCredit(
    CreditCardRequestModel data,
  ) {
    return executeApi(() async {
      var response = await _apiClient.checkoutCredit(data, "Bearer $token");
      return response;
    });
  }

  @override
  Future<Result<CheckoutCashResponseEntity>> checkoutCash(
    CreditCardRequestModel data,
  ) {
    return executeApi(() {
      var response = _apiClient.checkoutCash(data, "Bearer $token");
      return response;
    });
  }
}
