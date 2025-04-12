import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/create_cart_request.dart';

abstract class CartRemoteDataSource {
  Future<String> createCart(String token, String productId, int quantity);
}

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _apiClient;

  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<String> createCart(String token, String productId, int quantity) async {
    final request = CreateCartRequest(product: productId, quantity: quantity);
    try {
      final response = await _apiClient.addProductToCart("Bearer $token", request);
      return response.data.message;
    } on DioError catch (dioError) {
      throw Exception(dioError.response?.data['message'] ?? 'Unknown error occurred');
    }
  }
}
