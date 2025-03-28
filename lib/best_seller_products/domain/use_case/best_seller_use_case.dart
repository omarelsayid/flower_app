import 'package:flower_app/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/best_seller_products/domain/repo/best_seller_repo.dart';
import 'package:flower_app/core/common/result.dart';

class BestSellerUseCase {
  final BestSellerRepo _bestSellerRepo;

  BestSellerUseCase(this._bestSellerRepo);

  Future<Result<BestSellerProductsModel>> getBestSeller() async {
    return await _bestSellerRepo.getBestSeller();
  }
}
