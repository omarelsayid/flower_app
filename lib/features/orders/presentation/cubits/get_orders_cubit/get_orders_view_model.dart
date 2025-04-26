import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/orders/domain/use_case/get_order_use_case.dart';
import 'package:flower_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersViewModel extends Cubit<GetOrdersStates> {
  final GetOrderUseCase _getOrderUseCase;
  GetOrdersViewModel(this._getOrderUseCase) : super(GetOrdersInitialState());

  void getUserOrders() async {
    emit(GetOrdersLoadingState());
    final result = await _getOrderUseCase.execute();
    switch (result) {
      case Success():
        emit(GetOrdersSuccessState(result.data?.orders ?? []));
      case Error():
        emit(GetOrdersErrorState(result.exception ?? ''));
    }
  }
}
