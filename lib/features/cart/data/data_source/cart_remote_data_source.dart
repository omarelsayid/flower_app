import 'package:flower_app/features/cart/data/models/delet_cart_item_dto/delete_cart_response_dto.dart';
import 'package:flower_app/features/cart/data/models/update_product_quantity/update_cart_quantity_request.dart';
import 'package:flower_app/features/cart/data/models/update_product_quantity/update_cart_quantity_response_dto.dart';
import 'package:flower_app/features/cart/data/models/user_cart_response/user_cart_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_client.dart';
import '../models/create_cart_request.dart';

abstract class CartRemoteDataSource {
  Future<String> createCart(String token, String productId, int quantity);

  Future<UserCartResponseModel> getUserCart(String token);

  Future<DeleteCartResponseDTO> deleteCArtItem(String token, String id);
  Future<UpdateCartQuantityResponseDTO> updateCArtQuantity(
    String token,
    String id,
    int quantity,
  );
}

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _apiClient;

  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<String> createCart(
    String token,
    String productId,
    int quantity,
  ) async {
    final request = CreateCartRequest(product: productId, quantity: quantity);

    final response = await _apiClient.addProductToCart(
      "Bearer $token",
      request,
    );
    return response.data.message;
  }

  @override
  Future<UserCartResponseModel> getUserCart(String token) async {
    return await _apiClient.getUserCart("Bearer $token");
  }

  @override
  Future<DeleteCartResponseDTO> deleteCArtItem(String token, String id) async {
    final response = await _apiClient.deleteCartItem("Bearer $token", id);

    return response.data;
  }

  @override
  Future<UpdateCartQuantityResponseDTO> updateCArtQuantity(
    String token,
    String id,
    int quantity,
  ) async {
    final request = UpdateCartQuantityRequest(quantity: quantity);
    final response = await _apiClient.updateCartQuantity(
      "Bearer $token",
      id,
      request,
    );
    return response.data;
  }
}
