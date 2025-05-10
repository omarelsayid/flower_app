import 'package:flower_app/features/home/best_seller_products/data/data_source/best_seller_remote_data_source.dart';
import 'package:flower_app/features/home/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/features/home/best_seller_products/data/model/ProductModel.dart';
import 'package:flower_app/features/home/best_seller_products/domain/repo/best_seller_repo.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl extends BestSellerRepo {
  final BestSellerRemoteDataSource _bestSellerRemoteDataSource;
  BestSellerRepoImpl(this._bestSellerRemoteDataSource);

  @override
  Future<Result<BestSellerProductsModel>> getBestSeller() async {
    return await executeApi(() async {
      var result = await _bestSellerRemoteDataSource.getBestSeller();
      return result;
    });
  }
}
