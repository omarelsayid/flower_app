import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';

sealed class GetOrdersStates {}

class GetOrdersInitialState extends GetOrdersStates {}

class GetOrdersLoadingState extends GetOrdersStates {}

class GetOrdersSuccessState extends GetOrdersStates {
  final List<OrderEntity>? orders;
  GetOrdersSuccessState(this.orders);
}

class GetOrdersErrorState extends GetOrdersStates {
  final String error;
  GetOrdersErrorState(this.error);
}
