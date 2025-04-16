import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';

abstract class CartRepository {
  Future<String> addToCart(String token, String productId, int quantity);

  Future<Result<UserCartEntity>> getUserCart();

  Future<Result<String>> deleteCartItem(String id);
  Future<Result<String>> updateCartQuantity(String id, int newQuantity);


}
