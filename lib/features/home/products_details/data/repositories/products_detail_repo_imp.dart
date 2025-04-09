import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/products_details/data/data_source/products_details_remote_data_scource.dart';
import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';
import 'package:flower_app/features/home/products_details/domain/entities/products_details_entity.dart';
import 'package:flower_app/features/home/products_details/domain/repositories/get_product_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductDetailsRepo)
class ProductsDetailRepoImp extends GetProductDetailsRepo {
  final ProductsDetailsRemoteDataScource _productsDetailsRemoteDataScource;

  ProductsDetailRepoImp(this._productsDetailsRemoteDataScource);

  @override
  Future<Result<ProductDetailsEntity>> getProductDetails(String id) async {
    return await executeApi(() async {
      ProductsDetailsModels productsDetailsModels =
          await _productsDetailsRemoteDataScource.getProductDetails(id);
      return productsDetailsModels.toEntity();
    });
  }
}
