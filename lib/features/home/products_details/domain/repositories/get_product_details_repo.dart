import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/products_details/domain/entities/products_details_entity.dart';

abstract class GetProductDetailsRepo {
 Future<Result<ProductDetailsEntity>> getProductDetails(String id);
}
