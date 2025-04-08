import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/products_details/domain/entities/products_details_entity.dart';

abstract class GetProductDetailsRepo {
 Future<Result<ProductDetailsEntity>> getProductDetails(String id);
}
