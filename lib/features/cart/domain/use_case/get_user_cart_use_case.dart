import 'package:flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../entity/user_cart_entity.dart';

@injectable
class GetUserCartUseCase {
  final CartRepository _cartRepository;

  GetUserCartUseCase(this._cartRepository);

  Future<Result<UserCartEntity>> getUserCart() {
    return _cartRepository.getUserCart();
  }
}
