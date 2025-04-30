import 'package:dio/dio.dart';
import 'package:flower_app/core/error/failures.dart';
import 'package:flower_app/features/cart/data/models/map_user_cart_model_to_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/result.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../domain/entity/user_cart_entity.dart';
import '../../domain/repo/cart_repo.dart';
import '../data_source/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<String> addToCart(String token, String productId, int quantity) async {
    try {
      final message = await _cartRemoteDataSource.createCart(
        token,
        productId,
        quantity,
      );
      return message;
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<UserCartEntity>> getUserCart() async {
    try {
      final String token =
          await SharedPreferenceServices.getData(AppConstants.token).toString();
      final model = await _cartRemoteDataSource.getUserCart(token);
      final entity = MapUserCartToEntity.mapToEntity(model);
      return Success<UserCartEntity>(entity);
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioException(dioError);
      return Error<UserCartEntity>(failure.errorMessage);
    } catch (e) {
      return Error<UserCartEntity>(e.toString());
    }
  }

  @override
  Future<Result<String>> deleteCartItem(String id) async {
    try {
      final String token =
          await SharedPreferenceServices.getData(AppConstants.token).toString();
      final responseDto = await _cartRemoteDataSource.deleteCArtItem(token, id);
      return Success<String>(responseDto.message);
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioException(dioError);
      return Error<String>(failure.errorMessage);
    } catch (e) {
      return Error<String>(e.toString());
    }
  }

  @override
  Future<Result<String>> updateCartQuantity(String id, int newQuantity) async {
    try {
      final String token =
          await SharedPreferenceServices.getData(AppConstants.token).toString();

      final responseDTO = await _cartRemoteDataSource.updateCArtQuantity(
        token,
        id,
        newQuantity,
      );
      return Success<String>(responseDTO.message);
    } catch (e) {
      if (e is DioException) {
        final failure = ServerFailure.fromDioException(e);
        return Error<String>(failure.errorMessage);
      }
      return Error<String>(e.toString());
    }
  }
}
