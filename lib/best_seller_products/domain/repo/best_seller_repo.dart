import 'package:flower_app/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/core/common/result.dart';

abstract class BestSellerRepo {
  Future<Result<BestSellerProductsModel>> getBestSeller();
}
