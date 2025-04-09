import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import '../../../../../core/common/result.dart';

abstract class OccasionRepository {
  Future<Result<OccasionsResponseEntity>> getOccasion();
  Future<Result<ProductsResponseEntity>> getSpecificOccasion(String occasionId);

}
