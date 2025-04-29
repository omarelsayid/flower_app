import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';

abstract class GetOrdersRepo{
  Future<Result<OrdersResponseEntity>> getUserOrders();
}