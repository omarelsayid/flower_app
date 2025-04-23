import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../repo/cart_repo.dart';

@injectable
class UpdateCartQuantityUseCase {
  final CartRepository _cartRepository;

  UpdateCartQuantityUseCase(this._cartRepository);

  Future<Result<String>> execute(String id, int newQuantity) {
    return _cartRepository.updateCartQuantity(id, newQuantity);
  }
}
