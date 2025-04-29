


import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteUseCase{

  final CartRepository _cartRepository;

  DeleteUseCase(this._cartRepository);

  Future<Result<String>> execute(String id){

    return _cartRepository.deleteCartItem(id);

  }
}
