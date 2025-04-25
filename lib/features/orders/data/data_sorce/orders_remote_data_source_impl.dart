import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/features/orders/data/data_sorce/orders_remote_data_source.dart';
import 'package:flower_app/features/orders/data/model/orders_response_dto.dart';
import 'package:retrofit/dio.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiClient _apiClient;
  OrdersRemoteDataSourceImpl(this._apiClient);
  @override
  Future<OrdersResponseDTO> getUserOrders() async {
    HttpResponse<OrdersResponseDTO> response = await _apiClient.getUserOrders();
    return response.data;
  }
}
