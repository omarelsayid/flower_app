import 'package:injectable/injectable.dart';

import '../repo/cart_repo.dart';

@injectable
class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<String> execute({
    required String token,
    required String productId,
    required int quantity,
  }) {
    return _cartRepository.addToCart(token, productId, quantity);
  }
}
