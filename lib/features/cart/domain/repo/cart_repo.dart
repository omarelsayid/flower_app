abstract class CartRepository {
  Future<String> addToCart(String token, String productId, int quantity);
}