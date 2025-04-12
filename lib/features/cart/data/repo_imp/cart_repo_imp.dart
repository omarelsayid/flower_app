import 'package:injectable/injectable.dart';
import '../../domain/repo/cart_repo.dart';
import '../data_source/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<String> addToCart(String token, String productId, int quantity) async {
    try {
      final message = await _cartRemoteDataSource.createCart(token, productId, quantity);
      return message;
    } catch (e) {
      throw Exception(e);
    }
  }
}
