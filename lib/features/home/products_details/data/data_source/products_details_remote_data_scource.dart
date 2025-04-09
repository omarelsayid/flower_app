import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';

abstract class ProductsDetailsRemoteDataScource {
  Future<ProductsDetailsModels> getProductDetails(String id);
}
