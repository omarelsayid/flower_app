import 'package:flower_app/features/home/best_seller_products/data/model/BestSellerProductsModel.dart';

abstract class BestSellerRemoteDataSource {
  Future<BestSellerProductsModel> getBestSeller();
}
