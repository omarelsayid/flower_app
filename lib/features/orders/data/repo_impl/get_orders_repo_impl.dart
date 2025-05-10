import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/orders/data/data_sorce/orders_remote_data_source.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:flower_app/features/orders/domain/repo/get_orders_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetOrdersRepo)
class GetOrdersRepoImpl implements GetOrdersRepo {
  final OrdersRemoteDataSource _ordersRemoteDataSource;
  GetOrdersRepoImpl(this._ordersRemoteDataSource);
  @override
  Future<Result<OrdersResponseEntity>> getUserOrders() async {
    return await executeApi(() async {
      final data = await _ordersRemoteDataSource.getUserOrders();
      return data.toEntity();
    });
  }
}
