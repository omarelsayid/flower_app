import 'package:flower_app/features/home/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/features/home/best_seller_products/domain/repo/best_seller_repo.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerUseCase {
  final BestSellerRepo _bestSellerRepo;

  BestSellerUseCase(this._bestSellerRepo);

  Future<Result<BestSellerProductsModel>> getBestSeller() async {
    return await _bestSellerRepo.getBestSeller();
  }
}
