import 'package:flower_app/features/home/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/core/common/result.dart';

abstract class BestSellerRepo {
  Future<Result<BestSellerProductsModel>> getBestSeller();
}
