import 'package:flower_app/features/orders/data/model/orders_response_dto.dart';

abstract class OrdersRemoteDataSource {
  Future<OrdersResponseDTO> getUserOrders();
}