import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:flower_app/features/orders/domain/repo/get_orders_repo.dart';

class GetOrderUseCase {
  final GetOrdersRepo _getOrdersRepo;
  GetOrderUseCase(this._getOrdersRepo);

  Future<Result<OrdersResponseEntity>> execute() async {
    return await _getOrdersRepo.getUserOrders();
  }
}
