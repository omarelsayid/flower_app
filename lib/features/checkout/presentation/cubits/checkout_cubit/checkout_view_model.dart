import 'package:flower_app/features/checkout/domain/use_case/checkout_credit_use_case.dart';
import 'package:flower_app/features/checkout/presentation/cubits/checkout_cubit/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/result.dart';
import '../../../data/model/credit_card_request_model.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutState> {
  CheckoutViewModel(this._useCase) : super(CheckoutCreditLoadingState());

  final CheckoutCreditUseCase _useCase;
  void doIntent(CheckoutIntent intent) {
    switch (intent) {
      case CheckoutCreditIntent():
        _checkoutCredit(intent.data);
        break;
      case CheckoutCashIntent():
        _checkoutCash(intent.data);
        break;
    }
  }

  Future<void> customLauncgerUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      EasyLoading.showError("Can't launch $url");
    }
  }

  void _checkoutCredit(CreditCardRequestModel data) async {
    emit(CheckoutCreditLoadingState());
    final result = await _useCase.callCredit(data);
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          emit(CheckoutCreditSuccessState(data.session!));
          await customLauncgerUrl(data.session?.url ?? "");
        } else {
          emit(CheckoutCreditErrorState(data.message.toString()));
        }
        break;
      case Error():
        emit(CheckoutCreditErrorState(result.exception.toString()));
        break;
    }
  }

  void _checkoutCash(CreditCardRequestModel data) async {
    emit(CheckoutCashLoadingState());
    final result = await _useCase.executeCash(data);
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          emit(CheckoutCashSuccessState(data.order!));
        } else {
          emit(CheckoutCashErrorState(data.message.toString()));
        }
        break;
      case Error():
    }
  }
}

sealed class CheckoutIntent {}

class CheckoutCreditIntent extends CheckoutIntent {
  final CreditCardRequestModel data;

  CheckoutCreditIntent(this.data);
}

class CheckoutCashIntent extends CheckoutIntent {
  final CreditCardRequestModel data;

  CheckoutCashIntent(this.data);
}
